{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "tristan";
  home.homeDirectory = "/home/tristan";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05"; # Please read the comment before changing.

  # Packages
  home.packages = [
    pkgs.wofi
    pkgs.easyeffects
    pkgs.discord
    pkgs.dunst
    pkgs.grimblast
    pkgs.wl-clipboard
    pkgs.ollama-cuda
    pkgs.btop
    pkgs.xdg-desktop-portal-hyprland
    pkgs.nixfmt
  ];

  programs.vscodium = {
    enable = true;
    package = pkgs.vscodium-fhs;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      yzhang.markdown-all-in-one
    ];
  };

  programs.git = {
    enable = true;
    settings.user.name = "Tman564ws1077";
    settings.user.email = "tman564ws@tman564ws.com";
    settings = {
      init.defaultBranch = "main";
    };
  };

  programs.home-manager.enable = true;

  # Services
  services.easyeffects.enable = true;

  nixpkgs.config.allowUnfree = true;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/tristan/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Theming
  
  gtk = {
    theme = {
      name = "Adwaita-dark";
    };

    iconTheme = {
      name = "Adwaita-dark";
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  qt = {
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
}
