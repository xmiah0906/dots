
/* @TABS
 * Tabs settings and behavioring
========================================================================= */

  {
    "class": "tabset_control",
    "layer0.tint": [0, 150, 136],
    "layer0.inner_margin": [2, 6],
    "tint_index": 1
  },

  {
    "class": "tabset_control",
    "settings": ["!enable_tab_scrolling"],
    "content_margin": [0, 0, 8, 0]
  },

  {
    "class": "tab_control",
    "layer0.tint": [0, 150, 136],
    "layer0.opacity": 1.0,

    "layer1.texture": "Material Theme - Appbar/assets/teal/tab_current.png",
    "layer1.inner_margin": [0, 0],
    "layer1.opacity": 0.0,

    "layer2.tint": [255, 255, 255, 0],
    "layer2.opacity": { "target": 0.0, "speed": 3.0, "interpolation": "smoothstep" },

    "layer3.opacity": { "target": 1.0, "speed": 2.0, "interpolation": "smoothstep" },
    "layer3.texture": {
            "keyframes":
            [
              "Material Theme - Appbar/assets/teal/tab_animation1.png",
              "Material Theme - Appbar/assets/teal/tab_animation2.png",
              "Material Theme - Appbar/assets/teal/tab_animation3.png",
              "Material Theme - Appbar/assets/teal/tab_animation4.png",
              "Material Theme - Appbar/assets/teal/tab_animation5.png",
              "Material Theme - Appbar/assets/teal/tab_animation6.png",
              "Material Theme - Appbar/assets/teal/tab_animation7.png",
              "Material Theme - Appbar/assets/teal/tab_animation8.png",
              "Material Theme - Appbar/assets/teal/tab_animation9.png",
              "Material Theme - Appbar/assets/teal/tab_animation10.png",
              "Material Theme - Appbar/assets/teal/tab_animation11.png",
              "Material Theme - Appbar/assets/teal/tab_animation12.png",
              "Material Theme - Appbar/assets/teal/tab_animation13.png"
            ],
            "loop": false,
            "frame_time": 0.015,
    },

    "content_margin": [16, 0, 8, 0],
    "max_margin_trim": 0,
    "hit_test_level": 0.4
  },

    // Selected current tab

   {
    "class": "tab_control", "attributes": ["selected"],
    "layer1.opacity": 1.0,
    "layer2.opacity": 0.0,
    "layer3.opacity": 0.0
  },

    // Hovered current tab

  {
    "class": "tab_control", "attributes": ["hover"],
    "layer1.opacity": 1.0,
    "layer2.opacity": { "target": 0.6, "speed": 5.0, "interpolation": "smoothstep" },
    "layer3.opacity": { "target": 0.0, "speed": 2.0, "interpolation": "smoothstep" }
  },

    // Selected current tab

  {
    "class": "tab_control", "attributes": ["selected","hover"],
    "layer1.opacity": 1.0,
    "layer2.opacity": { "target": 0.6, "speed": 5.0, "interpolation": "smoothstep" },
    "layer3.opacity": 0.0
  },

    // Tab Labels

  {
    "class": "tab_label",
    "fg": [255, 255, 255]
  },

    // Tab selected label color

  {
    "class": "tab_label",
    "parents": [{"class": "tab_control", "attributes": ["selected"]}],
    "fg": [255, 255, 255, 255],
    "shadow_color": [255, 255, 255, 0],
    "shadow_offset": [0, 0]
  },

  {
    "class": "tab_label",
    "attributes": ["transient"],
    "font.italic": true
  },

  // Tab Close Buttons
  {
    "class": "tab_close_button",
    "settings": ["show_tab_close_buttons"],
    "content_margin": [8,8],

     // Close Icon
    "layer0.texture": "Material Theme - Appbar/assets/commons/close_icon--hover.png",
    "layer0.opacity": 0.6,
    "layer0.inner_margin": 0,

    // Close Icon Hover
    "layer1.texture": "Material Theme - Appbar/assets/commons/close_icon--hover.png",
    "layer1.opacity": { "target": 0.0, "speed": 5.0, "interpolation": "smoothstep" },

     // Dirty Icon
    "layer2.texture": "Material Theme - Appbar/assets/commons/dirty_icon--hover.png",
    "layer2.inner_margin": 0,

    // Dirty Icon Hover
    "layer3.texture": "Material Theme - Appbar/assets/commons/dirty_icon--hover.png",
    "layer3.opacity": { "target": 0.0, "speed": 5.0, "interpolation": "smoothstep" }
  },

    // Selected Tab
  {
    "class": "tab_close_button",
    "parents": [{"class": "tab_control", "attributes": ["selected"]}],
    "layer0.opacity": 0, // Close Icon
    "layer1.opacity": 1, // Close Icon Hover
  },
    // Default hover
  {
    "class": "tab_close_button",
    "settings": ["show_tab_close_buttons"],
    "attributes": ["hover"],
    "layer0.opacity": 0, // Close Icon
    "layer1.opacity": 1, // Close Icon Hover
  },
    // Dirty tab
  {
    "class": "tab_close_button",
    "parents": [{"class": "tab_control", "attributes": ["dirty"]}],
    "layer0.opacity": 0, // Close Icon
    "layer1.opacity": 0, // Close Icon Hover
    "layer2.opacity": 0, // Dirty Icon
    "layer3.opacity": 1, // Dirty Icon Hover
    "content_margin": [8,8],
  },
    // Dirty tab on hover
  {
    "class": "tab_close_button",
    "parents": [{"class": "tab_control", "attributes": ["dirty"]}],
    "attributes": ["hover"],
    "layer0.opacity": 0, // Close Icon
    "layer1.opacity": 1, // Close Icon Hover
    "layer2.opacity": 0, // Dirty Icon
    "layer3.opacity": 0  // Dirty Icon Hover
  },
    // Selected dirty tab
  {
    "class": "tab_close_button",
    "parents": [{"class": "tab_control", "attributes": ["selected", "dirty"]}],
    "layer0.opacity": 0, // Close Icon
    "layer1.opacity": 0, // Close Icon Hover
    "layer2.opacity": 0, // Dirty Icon
    "layer3.opacity": 1  // Dirty Icon Hover
  },

  // Selected dirty tab on hover

  {
    "class": "tab_close_button",
    "parents": [{"class": "tab_control", "attributes": ["selected", "dirty"]}],
    "attributes": ["hover"],
    "layer0.opacity": 0, // Close Icon
    "layer1.opacity": 1, // Close Icon Hover
    "layer2.opacity": 0, // Dirty Icon
    "layer3.opacity": 0  // Dirty Icon Hover
  },

  // Overflow dropdown menu

  {
    "class": "show_tabs_dropdown_button",
    "layer0.texture": "Material Theme - Appbar/assets/commons/overflow_menu--hover.png",
    "layer0.opacity": 0.8,
    "layer1.texture": "Material Theme - Appbar/assets/commons/overflow_menu--hover.png",
    "layer1.opacity": { "target": 0.0, "speed": 8.0, "interpolation": "smoothstep" },
  },

  {
    "class": "show_tabs_dropdown_button",
    "attributes": ["hover"],
    "layer1.opacity": { "target": 1.0, "speed": 8.0, "interpolation": "smoothstep" }
  },

  // tab set scroll left | scroll right

  {
    "class": "scroll_tabs_left_button",
    "layer0.texture": "Material Theme - Appbar/assets/commons/arrow_left--hover.png",
    "layer0.opacity": 0.6,
    "layer1.texture": "Material Theme - Appbar/assets/commons/arrow_left--hover.png",
    "layer1.opacity": { "target": 0.0, "speed": 8.0, "interpolation": "smoothstep" },
  },

  {
    "class": "scroll_tabs_left_button",
    "attributes": ["hover"],
    "layer1.opacity": { "target": 1.0, "speed": 8.0, "interpolation": "smoothstep" }
  },

  {
    "class": "scroll_tabs_right_button",
    "layer0.texture": "Material Theme - Appbar/assets/commons/arrow_right--hover.png",
    "layer0.opacity": 0.6,
    "layer1.texture": "Material Theme - Appbar/assets/commons/arrow_right--hover.png",
    "layer1.opacity": { "target": 0.0, "speed": 8.0, "interpolation": "smoothstep" },
  },

  {
    "class": "scroll_tabs_right_button",
    "attributes": ["hover"],
    "layer1.opacity": { "target": 1.0, "speed": 8.0, "interpolation": "smoothstep" }
  },
