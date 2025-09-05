{config, pkgs, ...}:
{
    home.stateVersion = "25.05";
    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs;
    [
        blender
        freecad
        kicad
        vscode
        arduino-ide
        prusa-slicer
        libreoffice-fresh
        discord
        telegram-desktop
        steam
        steam-run
    ];

    programs.git = 
    {
        enable = true;
        userName = "sudhanshunitinatalkar";
        userEmail = "atalkarsudhanshu@oroton.me";
    };

    programs.bash = 
    {
        enable = true;
        initExtra = 
        ''
           nrs()
           {
                cd ~/nixos-cosmos-config || return
                git pull --rebase origin main || echo "Pull failed, only commiting changes"
                git add .
                git commit -m "config update: $(date "+%Y-%m-%d %H:%M:%S")"
                git push origin main || echo "Push failed, internet down?"
                sudo nixos-rebuild switch --flake .#cosmos 
            }  
        '';
    };

}