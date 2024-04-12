{inputs, pkgs, ...}: {

  home = {
    sessionVariables.BROWSER = "firefox";

    file."firefox-one" = {
      target = ".mozilla/firefox/default/chrome/firefox-one";
      source = ./css/firefox-one;
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
        userChrome = ./css/userChrome.css;
        userContent = ./css/userContent.css;
      };
    };
  };
}
