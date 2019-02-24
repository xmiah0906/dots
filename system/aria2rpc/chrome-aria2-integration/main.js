var settings = new Store('settings', {
    "rpcpath" : "http://localhost:6800/jsonrpc",
    "rpcuser" : "",
    "rpctoken" : "aria2-rpc-chrome",
    "filesizesetting" : "500M",
    "whitelisttype" : "",
    "whitelistsite" : "",
    "blacklistsite" : "",
    "captureCheckbox" : true,
    "sizecaptureCheckbox" : false,
    "libnotifyCheckbox" : false,
    "stGeneralDir": "",
    "stMusicDir": "",
    "stPictureDir": "",
    "stVideoDir": "",
    "stDocumentDir": "",
    "stCompressedDir": "",    
    "stMusicFt": "mp3 wav ogg m4a flac wma",
    "stPictureFt": "jpg png gif svg",
    "stVideoFt": "mp4 wmv webm mkv flv",
    "stDocumentFt": "docx doc xls xlsx pdf odt odx ods html pptx",
    "stCompressedFt": "zip rar 7z gz tar"
});

chrome.storage.local.set({"rpcpath":settings.get('rpcpath')});
chrome.storage.local.set({"rpcuser":settings.get('rpcuser')});
chrome.storage.local.set({"rpctoken":settings.get('rpctoken')});

//Binux 
//https://github.com/binux

var ARIA2 = (function () {
    "use strict";
    function get_auth(url) {
        return url.match(/^(?:(?![^:@]+:[^:@\/]*@)[^:\/?#.]+:)?(?:\/\/)?(?:([^:@]*(?::[^:@]*)?)?@)?/)[1];
    }
    
    function request(jsonrpc_path, method, params) {
        var jsonrpc_version = '2.0', xhr = new XMLHttpRequest(), auth = get_auth(jsonrpc_path);
        var request_obj = {
            jsonrpc: jsonrpc_version,
             method: method,
             id: (new Date()).getTime().toString()
        };
        if (params) {
            request_obj.params = params;
        }
        xhr.open("POST", jsonrpc_path + "?tm=" + (new Date()).getTime().toString(), true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
        if (settings.get('rpcuser')) {
            xhr.setRequestHeader("Authorization", "Basic " + btoa(settings.get('rpcuser') + ':' + settings.get('rpctoken')));
        } else {
            if (settings.get('rpctoken')) {
                request_obj.params = ['token:' + settings.get('rpctoken')].concat(request_obj.params);
            }
        }
        xhr.send(JSON.stringify(request_obj));
    }
    return function (jsonrpc_path) {
        this.jsonrpc_path = jsonrpc_path;
        this.addUri = function (uri, options) {
            request(this.jsonrpc_path, 'aria2.addUri', [[uri], options]);
        };
        return this;
    };
}());


function showNotification() {
    "use strict";
    if (settings.get('libnotifyCheckbox')) return;
    var notfopt = {
        type: "basic",
        title: "Aria2 Integration",
        iconUrl: "icons/notificationicon.png",
        message: "The download has been sent to aria2 queue"
    };
    chrome.notifications.create("senttoaria2", notfopt, function () {return; });
    window.setTimeout(function () {chrome.notifications.clear("senttoaria2", function () {return; }); }, 3000);
}

// context menu module
chrome.contextMenus.create(
    {
        title: 'Download with aria2',
        id: "linkclick",
        contexts: ['link','image']
    }
);

chrome.contextMenus.onClicked.addListener(function (info, tab) {
    "use strict";
        if (info.menuItemId === "linkclick") {
            chrome.downloads.download({url: info.srcUrl? info.srcUrl : info.linkUrl});
        }
});

//Auto capture module
function sitelistProc(list) {
    var re_list;
    if (list === '') {
        re_list = new RegExp('^\\s$', "g");
    } else {
        list = list.replace(/\./g, "\\.");
        list = list.replace(/\,/g, "|");
        list = list.replace(/\*/g, "[^ ]*");
        re_list = new RegExp(list, "gi");
    }
    return re_list;
}

function isCapture(size, url, name) {
    "use strict";
        var bsites = settings.get('blacklistsite'), wsites = settings.get('whitelistsite');
        var re_bsites = sitelistProc(bsites), re_wsites = sitelistProc(wsites);
        
        var ftypes = settings.get('whitelisttype').toLowerCase();
        var Intype = ftypes.indexOf(name.split('.').pop().toLowerCase());
        
        var thsize = settings.get('filesizesetting');
        var thsizeprec = ['K', 'M', 'G', 'T'];
        var thsizebytes = thsize.match(/[\d\.]+/)[0] * Math.pow(1024, thsizeprec.indexOf(thsize.match(/[a-zA-Z]+/)[0].toUpperCase()) + 1);
        
        var res;
        switch (true) {
            case url.substring(0,5) === 'blob:':
                res = 0;
                break;
            case re_bsites.test(url):
                res = 0;
                break;
            case re_wsites.test(url):
                res = 1;
                break;
            case (Intype !== -1):
                res = 1;
                break;
            case (size >= thsizebytes && settings.get('sizecaptureCheckbox') || !settings.get('sizecaptureCheckbox')):
                res = 1;
                break;
            default:
                res = 0;
        }
        
        return res;
}

function captureAdd(Item) {
    "use strict";
        
        var type = ["general", settings.get("stMusicFt"), settings.get("stPictureFt"), settings.get("stVideoFt"), settings.get("stDocumentFt"), settings.get("stCompressedFt")];
        var dir = [settings.get("stGeneralDir"), settings.get("stMusicDir"), settings.get("stPictureDir"), settings.get("stVideoDir"), settings.get("stDocumentDir"), settings.get("stCompressedDir")];
        
        var filetype = Item.filename.match(/\.([a-z0-9]+)$/i);
        filetype = filetype? filetype[1] : "general";
        
        var dirIndex = 0;
        for (var i=0; i<type.length; i++)
        {
            if (type[i].indexOf(filetype) > -1) {
                dirIndex = i;
                break;
            }
        }
        
        function setDir(obj) {
            if (dir[dirIndex] !== "")
            {
                obj.dir = dir[dirIndex];
            }
        }
        
        if (isCapture(Item.fileSize, Item.url, Item.filename) === 1) {
            var aria2 = new ARIA2(settings.get('rpcpath')), params = {};
            params.out = Item.filename;
            
            getCookie(Item.url, function (cookie) {
                params.header = "Cookie:" + cookie;
                setDir(params);
                aria2.addUri(Item.url, params);
                showNotification();
            });
        }
}

chrome.downloads.onDeterminingFilename.addListener(function (Item) {
    "use strict";
        if (settings.get('captureCheckbox') && isCapture(Item.fileSize, Item.url, Item.filename) === 1) {
            chrome.downloads.cancel(Item.id);
            if (Item.byExtensionName !== "Aria2c Integration Plus") {
                chrome.downloads.download({url: Item.url});
            } else {
                captureAdd(Item);
            }
        }
});

// get all cookies, include httponly ones.
function getCookie(url, callback)
{
    chrome.cookies.getAll({url: url}, function(cookies) {
        var cookie = [];
        for (var i=0; i<cookies.length; i++) {
            cookie[i] = cookies[i].name + "=" + cookies[i].value;
        }
        cookie = cookie.join("; ");
        callback(cookie);
    });
}
