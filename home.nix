{
  config,
  pkgs,
  nixpkgs,
  inputs,
  ...
}:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "prot";
  home.homeDirectory = "/home/prot";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  gtk = {
    enable = true;
    font.name = "Ubuntu Regular 10";
    theme = {
      name = "Gruvbox-Dark-B-LB";
      package = pkgs.gruvbox-gtk-theme;
    };

    iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = pkgs.gruvbox-plus-icons;
    };

    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
  };

  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      profiles = {
        default = {
          id = 0;
          name = "default";
          isDefault = true;
          settings = {
            "browser.startup.homepage" = "about:home";
            "browser.search.defaultenginename" = "Google";
            "browser.search.order.1" = "Google";
            "ui.systemUsesDarkTheme" = true;
            "browser.newtabpage.enabled" = true;
            "browser.newtabpage.activity-stream.topSitesRows" = 2;
            "browser.newtabpage.pinned" = [
              {
                "label" = "NixOS Packages";
                "url" = "https://search.nixos.org/packages";
              }
              {
                "label" = "NixOS Options";
                "url" = "https://search.nixos.org/options";
              }
              {
                "label" = "Home Manager Options";
                "url" = "https://nix-community.github.io/home-manager/options.xhtml";
              }
              {
                "label" = "NixOS & Flakes Book";
                "url" = "https://nixos-and-flakes.thiscute.world/";
              }
            ];
          };
          search = {
            force = true;
            default = "Google";
            order = [
              "Google"
              "Duckduckgo"
            ];
          };
        };
      };
    };
  };

  # Enlaces simbólicos de archivos de configuración desde /etc/nixos/config hacia ~/.config
  # (Recarga en caliente: no es necesario re-empaquetar el sistema; simplemente se debe
  # modificar el archivo en cuestión)
  home = {

    # wayfire configs files
    file = {
      ".config/wayfire.ini" = {
        source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/config/wayfire.ini;
        recursive = false;
      };
    };

    # hyprland configs files
    file = {
      ".config/hypr" = {
        source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/config/hypr;
        recursive = false;
      };
    };

    # kanshi configs files
    file = {
      ".config/kanshi" = {
        source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/config/kanshi;
        recursive = true;
      };
    };

    # waybar configs files
    file = {
      ".config/waybar" = {
        source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/config/waybar;
        recursive = true;
      };
    };

    # nwg-bar configs files
    file = {
      ".config/nwg-bar" = {
        source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/config/nwg-bar;
        recursive = true;
      };
    };

    # nwg-bar configs files
    file = {
      ".config/nwg-dock-hyprland" = {
        source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/config/nwg-dock-hyprland;
        recursive = true;
      };
    };

    # terminator configs files
    file = {
      ".config/terminator" = {
        source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/config/terminator;
        recursive = true;
      };
    };

    # pcmanfm configs files
    file = {
      ".config/pcmanfm" = {
        source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/config/pcmanfm;
        recursive = true;
      };
    };

    # conky configs files
    file = {
      ".config/conky" = {
        source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/config/conky;
        recursive = true;
      };
    };

    # remind configs files
    file = {
      ".config/remind" = {
        source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/config/remind;
        recursive = true;
      };
    };

    # mousepad configs files
    file = {
      ".config/mousepad" = {
        source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/config/mousepad;
        recursive = true;
      };
    };

    # radiotray-ng configs files
    file = {
      ".config/radiotray-ng" = {
        source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/config/radiotray-ng;
        recursive = true;
      };
    };

    # swaync configs files
    file = {
      ".config/swaync" = {
        source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/config/swaync;
        recursive = true;
      };
    };
  };
}
