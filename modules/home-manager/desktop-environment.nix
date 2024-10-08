{pkgs, ...}: {
  home.packages = [pkgs.libsForQt5.bismuth];

  programs.plasma = {
    enable = true;

    configFile = {
      "kded5rc"."Module-gtkconfig"."autoload" = false;

      "kscreenlockerrc"."Daemon" = {
        "LockGrace" = 15;
        "Timeout" = 30;
      };

      "krunnerrc"."Plugins" = {
        "CharacterRunnerEnabled" = false;
        "DictionaryEnabled" = false;
        "PowerDevilEnabled" = false;
        "baloosearchEnabled" = false;
        "bookmarksEnabled" = false;
        "browserhistoryEnabled" = false;
        "browsertabsEnabled" = false;
        "calculatorEnabled" = false;
        "desktopsessionsEnabled" = false;
        "helprunnerEnabled" = false;
        "katesessionsEnabled" = false;
        "konsoleprofilesEnabled" = false;
        "krunner_killEnabled" = false;
        "krunner_spellcheckEnabled" = false;
        "krunner_systemsettingsEnabled" = false;
        "kwinEnabled" = false;
        "locationsEnabled" = false;
        "org.kde.activities2Enabled" = false;
        "org.kde.datetimeEnabled" = false;
        "org.kde.windowedwidgetsEnabled" = false;
        "placesEnabled" = false;
        "plasma-desktopEnabled" = false;
        "recentdocumentsEnabled" = false;
        "unitconverterEnabled" = false;
        "webshortcutsEnabled" = false;
        "windowsEnabled" = false;
      };

      "kwinrc" = {
        "Desktops" = {
          "Number" = 4;
          "Rows" = 2;
        };

        "Effect-slide" = {
          "HorizontalGap" = 0;
          "SlideBackground" = false;
          "VerticalGap" = 0;
        };

        "Plugins" = {
          "bismuthEnabled" = true;
          "desktopchangeosdEnabled" = true;
        };

        "Script-bismuth" = {
          "screenGapBottom" = 12;
          "screenGapLeft" = 12;
          "screenGapRight" = 12;
          "screenGapTop" = 12;
          "tileLayoutGap" = 12;
        };

        "Script-desktopchangeosd"."PopupHideDelay" = 200;
        "Tiling"."padding" = 4;

        "Windows" = {
          "DelayFocusInterval" = 0;
          "FocusPolicy" = "FocusFollowsMouse";
        };
      };

      "kwinrulesrc" = {
        "1" = {
          "Description" = "Global";
          "minsize" = "1,1";
          "minsizerule" = 2;
          "noborder" = true;
          "noborderrule" = 2;
          "wmclass" = ".*";
          "wmclassmatch" = 3;
        };

        "General" = {
          "count" = 1;
          "rules" = 1;
        };
      };
    };

    hotkeys.commands."rofimoji" = {
      name = "Launch rofimoji";
      key = "Meta+R";
      # command = ''rofi -modi "emoji:rofimoji" -show'';
      command = "rofimoji";
    };

    shortcuts = {
      "bismuth"."toggle_window_floating" = "Meta+F";

      "kwin" = {
        "Switch One Desktop Down" = "Meta+J";
        "Switch One Desktop Up" = "Meta+K";
        "Switch One Desktop to the Left" = "Meta+H";
        "Switch One Desktop to the Right" = "Meta+L";
      };
    };

    workspace.clickItemTo = "select";
  };
}
