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
  


}