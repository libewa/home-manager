{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "workspace special silent, cmatrix-wallpaper"
      "nofocus, cmatrix-wallpaper"
      "noblur, cmatrix-wallpaper"
      "noborder, cmatrix-wallpaper"
      "noshadow, cmatrix-wallpaper"
      "float, cmatrix-wallpaper"

      "move 0 0, cmatrix-wallpaper"
      "size 100% 100%, cmatrix-wallpaper"
    ];
    exec-once = [
      "kitty --class cmatrix-wallpaper -e ${../dotfiles/cmatrix-wallpaper.sh}"
    ];
  };
}

