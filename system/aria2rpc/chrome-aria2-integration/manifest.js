this.manifest = {
    "name": "Aria2c Integration Plus",
    "icon": "icons/icon64.png",
    "settings": [
        {
            "tab": i18n.get("RPC"),
            "name": "rpcpath",
            "type": "text",
            "label": i18n.get("JSONRPCPath"),
            "text": i18n.get("JSONRPCPathExample")
        },
        {
            "tab": i18n.get("RPC"),
            "name": "rpcuser",
            "type": "text",
            "label": i18n.get("RPCUser")
        },
        {
            "tab": i18n.get("RPC"),
            "name": "rpcuserDescription",
            "type": "description",
            "text": i18n.get("rpcuserDescription")
        },
        {
            "tab": i18n.get("RPC"),
            "name": "rpctoken",
            "type": "text",
            "label": i18n.get("RPCToken"),
            "masked": true
        },
        {
            "tab": i18n.get("RPC"),
            "name": "rpctokenDescription",
            "type": "description",
            "text": i18n.get("rpctokenDescription")
        },
        {
            "tab": i18n.get("RPC"),
            "name": "rpcsettingsDescription",
            "type": "description",
            "text": i18n.get("rpcsettingsDescription")
        },
		{
            "tab": i18n.get("capture"),
            "name": "captureCheckbox",
            "type": "checkbox",
            "label": i18n.get("enablecap")
        },
		{
            "tab": i18n.get("capture"),
            "group": i18n.get("sizerule"),
            "name": "sizecaptureCheckbox",
            "type": "checkbox",
            "label": "Enable"
        },
        {
            "tab": i18n.get("capture"),
            "group": i18n.get("sizerule"),
            "name": "filesizesetting",
            "type": "text",
            "label": i18n.get("filesize"),
            "text": "500M"
        },
        {
            "tab": i18n.get("capture"),
            "group": i18n.get("sizerule"),
            "name": "filesizeDescription",
            "type": "description",
            "text": i18n.get("filesizeDescription")
        },
        {
            "tab": i18n.get("capture"),
            "group": i18n.get("whitelisttype"),
            "name": "whitelisttype",
            "type": "textarea",
        },
        {
            "tab": i18n.get("capture"),
            "group": i18n.get("whitelisttype"),
            "name": "whitelisttypeDescription",
            "type": "description",
            "text": i18n.get("whitelisttypeDescription")
        },
        {
            "tab": i18n.get("capture"),
            "group": i18n.get("whitelistsite"),
            "name": "whitelistsite",
            "type": "textarea",
        },
        {
            "tab": i18n.get("capture"),
            "group": i18n.get("whitelistsite"),
            "name": "whitelistsiteDescription",
            "type": "description",
            "text": i18n.get("whitelistsiteDescription")
        },
        {
            "tab": i18n.get("capture"),
            "group": i18n.get("blacklistsite"),
            "name": "blacklistsite",
            "type": "textarea",
        },
        {
            "tab": i18n.get("capture"),
            "group": i18n.get("blacklistsite"),
            "name": "blacklistsiteDescription",
            "type": "description",
            "text": i18n.get("blacklistsiteDescription")
        },
        {
            "tab": i18n.get("saveto"),
            "name": "stDescription",
            "type": "description",
            "text": i18n.get("stDescription")
        },         
        {
            "tab": i18n.get("saveto"),
            "group": i18n.get("stGeneral"),
            "name": "stGeneralDir",
            "type": "text",
            "label": i18n.get("stDirLabel"),
            "text" : "default"
        },
        {
            "tab": i18n.get("saveto"),
            "group": i18n.get("stMusic"),
            "name": "stMusicDir",
            "type": "text",
            "label": i18n.get("stDirLabel"),
            "text" : "default"
        },
        {
            "tab": i18n.get("saveto"),
            "group": i18n.get("stMusic"),
            "name": "stMusicFt",
            "type": "text",
            "label": i18n.get("stFtLabel"),
            "text" : "mp3 m4a wav..."
        },    
        {
            "tab": i18n.get("saveto"),
            "group": i18n.get("stPicture"),
            "name": "stPictureDir",
            "type": "text",
            "label": i18n.get("stDirLabel"),
            "text" : "default"
        },
        {
            "tab": i18n.get("saveto"),
            "group": i18n.get("stPicture"),
            "name": "stPictureFt",
            "type": "text",
            "label": i18n.get("stFtLabel"),
            "text" : "jpg png gif..."
        },  
        {
            "tab": i18n.get("saveto"),
            "group": i18n.get("stVideo"),
            "name": "stVideoDir",
            "type": "text",
            "label": i18n.get("stDirLabel"),
            "text" : "default"
        },
        {
            "tab": i18n.get("saveto"),
            "group": i18n.get("stVideo"),
            "name": "stVideoFt",
            "type": "text",
            "label": i18n.get("stFtLabel"),
            "text" : "mp4 wmv..."
        },  
        {
            "tab": i18n.get("saveto"),
            "group": i18n.get("stDocument"),
            "name": "stDocumentDir",
            "type": "text",
            "label": i18n.get("stDirLabel"),
            "text" : "default"
        },
        {
            "tab": i18n.get("saveto"),
            "group": i18n.get("stDocument"),
            "name": "stDocumentFt",
            "type": "text",
            "label": i18n.get("stFtLabel"),
            "text" : "txt docx odt xlsx pdf..."
        },          
        {
            "tab": i18n.get("saveto"),
            "group": i18n.get("stCompressed"),
            "name": "stCompressedDir",
            "type": "text",
            "label": i18n.get("stDirLabel"),
            "text" : "default"
        },
        {
            "tab": i18n.get("saveto"),
            "group": i18n.get("stCompressed"),
            "name": "stCompressedFt",
            "type": "text",
            "label": i18n.get("stFtLabel"),
            "text" : "zip rar tar..."
        },          
        {
            "tab": i18n.get("misc"),
            "name": "libnotifyCheckbox",
            "type": "checkbox",
            "label": i18n.get("libnotifyCheckbox")         
        },
        {
            "tab": i18n.get("misc"),
            "name": "libnotifyDescription",
            "type": "description",
            "text": i18n.get("libnotifyDescription")
        },        
    ],
    "alignment": [
        [
            "rpcpath",
            "rpcuser",
            "rpctoken"
        ],
        [
        	"filesizesetting",
        ],
    ]
};
