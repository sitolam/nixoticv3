{inputs, ...}: {
  home = {
    sessionVariables.BROWSER = "firefox";

    # file."firefox-gnome-theme" = {
    #   target = ".mozilla/firefox/default/chrome/firefox-gnome-theme";
    #   source = inputs.firefox-gnome-theme;
    # };

    file."chrome" = {
      target = ".mozilla/firefox/default/chrome";
      source = "./css/chrome";
    };

    file."user.js" = {
      target = ".mozilla/firefox/default/user.js";
      source = "./css/user.js";
    };


  };

  programs.firefox = {
    enable = true;
    profiles.default = {
      name = "Default";
      settings = {
        "browser.tabs.loadInBackground" = true;
        "widget.gtk.rounded-bottom-corners.enabled" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "svg.context-properties.content.enabled" = true;
        "gnomeTheme.hideSingleTab" = true;
        "gnomeTheme.bookmarksToolbarUnderTabs" = true;
        "gnomeTheme.normalWidthTabs" = false;
        "gnomeTheme.tabsAsHeaderbar" = false;
      };
      # userChrome = ''
      #   @import "firefox-gnome-theme/userChrome.css";
      # '';
      # userContent = ''
      #   @import "firefox-gnome-theme/userContent.css";
      # '';
    };
  };
}
