{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      leftbar = {
        height = 50;
	spacing = 20;
	position = "left";
	modules-left = [ "custom/power" ];
	modules-center = [ "hyprland/workspaces" ];
	modules-right = [ "tray" ];

        tray = {
          spacing = 10;
        };
        "custom/power" = {
          format = "󰐥 Power options";
          on-click = "rofi -show power-menu -modi power-menu:rofi-power-menu";
        };
	"hyprland/workspaces" = {
	  format-icons = {
	    empty = "";
	    active = "";
	    default = "";
	  };
	  format = "{icon}";
	};
      };
      topbar = {
        height = 30;
        spacing = 10;
        position = "top";
        modules-center = [ "hyprland/window" ];
        modules-right = [ "network" "pulseaudio" "memory" "backlight" "keyboard-state" "hyprland/language" "battery" "clock" ];

        keyboard-state = {
          numlock = false; # yoga laptop doesnt have numlock
          capslock = true;
          format = "{name} {icon}";
          format-icons = {
            locked = "";
            unlocked = "";
          };
        }; 
        clock = {
          tooltip-format = "{:%d.%m.%Y}";
        };
        memory = {
          format = "{}% ";
	  onclick = "kitty htop";
        }; 
        backlight = {
          format = "{percent}% {icon}";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
        };
        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-full = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = ["" "" "" "" ""];
        };

        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          tooltip-format = "{ifname}: {ipaddr}/{cidr}";
	  on-click = "networkmanager_dmenu";
        };

        pulseaudio = {
          format = "{volume}% {icon}";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };
      };
    };
    style = ''
      * {
	font-family: "Ubuntu Nerd Font";
	font-size: 13px;
      }
      /*#window {
	max-width = 350px;
      }*/
      window#waybar {
	border: none;
	border-radius: 0; 
	min-height: 0;
	background: none;
	color: #fff;
	padding-top: 2px;
	padding-bottom: 2px
      }

      window#waybar {
	/* From https://css.glass */
	background: rgba(255, 255, 255, 0.1);
	box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
	border-bottom: 3px solid rgba(100, 114, 125, 0.5);
	padding-left: 4px;
	padding-right: 4px;
      }

      tooltip {
	background: rgba(43, 48, 59, 0.9);
	border: 1px solid rgba(100, 114, 125, 0.5);
      }
      #workspaces button {
        color: white;
	background: none;
      }
    '';
  };
}
