{inputs, pkgs, ...}: {

  home = {
    sessionVariables.BROWSER = "firefox";

    file."firefox-one" = {
      target = ".mozilla/firefox/default/chrome/firefox-one";
      source = ./css/firefox-one;
    };
  };  


  programs.firefox = {
    enable = true;
    profiles.default = {
      name = "Default";
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "svg.context-properties.content.enabled" = true;
        "layout.css.color-mix.enabled" = true;
        "browser.tabs.delayHidingAudioPlayingIconMS" = 0;
        "layout.css.backdrop-filter.enabled" = true;
        "browser.newtabpage.activity-stream.improvesearch.handoffToAwesomebar" = false;
        "privacy.userContext.enabled" = true;
        "privacy.userContext.ui.enabled" = true;
        "privacy.userContext.longPressBehavior" = 2;
      };
      userChrome = ''
        /* Source file made available under Mozilla Public License v. 2.0 See the main repository for updates as well as full license text. 
          https://github.com/Godiesc/firefox-gx */

        /* ############# Required files ############## */

        @import url('firefox-one/components/one_root.css');
        @import url('firefox-one/components/one_root-personal.css');
        @import url('firefox-one/components/one_toolbar-icons.css');
        @import url('firefox-one/components/one_containers.css');
        @import url('firefox-one/components/one_tabs-bar.css');
        @import url('firefox-one/components/one_urlbar-searchbar.css');
        @import url('firefox-one/components/one_windows-controls.css');
        @import url('firefox-one/components/one_customize-styles.css');
        @import url('firefox-one/components/one_sound.css');
        @import url('firefox-one/components/one_arrowpanel.css');
        @import url('firefox-one/components/one_contextual-menu.css');
        @import url('firefox-one/components/one_notifications.css');
        @import url('firefox-one/components/one_close-button.css');
        @import url('firefox-one/components/one_button-styles.css');
        @import url('firefox-one/components/one_library.css');
        @import url('firefox-one/components/one_hamburger-menu-icons.css');
        @import url('firefox-one/components/one_menu.css');
        @import url('firefox-one/components/one_left-sidebar.css');
        @import url('firefox-one/components/one_tree-tabs.css');
        @import url('firefox-one/components/one_optional-features.css');
        @import url('firefox-one/components/one_tricks.css');
      '';

      userContent = ''
      /* Source file made available under Mozilla Public License v. 2.0 See the main repository for updates as well as full license text. 
        https://github.com/Godiesc/opera-gx */  

      @import url(firefox-one/components/one_root-personal.css);
      @import url(firefox-one/components/one_UC-newtabpage.css);
      @import url(firefox-one/components/one_UC-settings-addons-pages.css);
      @import url(firefox-one/components/one_UC-addons-store.css);
      '';
    };
  };
}
