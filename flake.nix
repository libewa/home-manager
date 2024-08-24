{
  description = "Home Manager configuration of linus";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:libewa/home-manager-1/zed-editor";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... } :
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations = {
        "linus" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [
            ./home.nix
            ./guionly.nix
            ./modules/hyprland.nix
            ./modules/waybar.nix
            ./modules/nvim
            ./modules/zsh.nix
	    ./modules/cmatrix-wallpaper.nix
            ./modules/vscode.nix
	    ./modules/zed.nix
	    ./modules/rofi.nix
	    ./modules/yt-dlp.nix
	    ./modules/git.nix
            {
              # Home Manager needs a bit of information about you and the paths it should
              # manage.
              home.username = "linus";
              home.homeDirectory = "/home/linus";
            }
          ];

          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
        };
        nixos = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [ ./home.nix {
            # Home Manager needs a bit of information about you and the paths it should
            # manage.
            home.username = "nixos";
            home.homeDirectory = "/home/nixos";
          }];
        };
      };
      nixosModules.default = { inputs, ... }: {
        imports = [
          inputs.home-manager.nixosModules.home-manager
        ];
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.nixos = import ./home.nix;

        # Optionally, use home-manager.extraSpecialArgs to pass
        # arguments to home.nix
      };
    };
}
