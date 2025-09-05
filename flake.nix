{
    description = "multiverse";
    
    inputs = 
    {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
        home-manager = 
        {
            url = "github:nix-community/home-manager/release-25.05"; 
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, ... }:
    {
        nixosConfigurations.cosmos = nixpkgs.lib.nixosSystem
        {
            system = "x86_64-linux";
            modules = 
            [
                ./configuration.nix
                ./hardware-configuration.nix
                ./nvidia.nix
                home-manager.nixosModules.home-manager
                {home-manager.users.cosmicdust = import ./home.nix; }
            ];
            
        };
    };
}