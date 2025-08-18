EAPI=8
 
DESCRIPTION="A metapackage containing all dependencies for the Caelestia dotfiles"
HOMEPAGE="https://github.com/caelestia-dots/caelestia"

LICENSE="GPL-3.0-only"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm64"
IUSE="uswm gnome-keyring polkit-gnome"


RDEPEND="sys-apps/caelestia-cli
         gui-wm/caelestia-shell
         gui-wm/hyprland
         gui-libs/xdg-desktop-portal-hyprland
         sys-apps/xdg-desktop-portal-gtk
         gui-apps/hyprpicker
         gui-apps/hypridle
         gui-apps/wl-clipboard
         app-misc/cliphist
         net-wireless/bluez-tools
         sys-fs/inotify-tools
         sys-apps/app2unit
         media-video/wireplumber
         app-misc/trash-cli
         gui-apps/foot
         app-shells/fish
         app-misc/fastfetch
         app-shells/starship
         sys-process/btop
         app-misc/jq
         net-misc/socat
         media-gfx/imagemagick
         net-misc/curl
         x11-themes/adw-gtk3
         x11-themes/papirus-icon-theme
         x11-misc/qt5ct
         gui-apps/qt6ct
         media-fonts/jetbrains-mono
         media-fonts/symbols-nerd-font
         uswm? ( gui-apps/uwsm )
         gnome-keyring? ( gnome-base/gnome-keyring )
         polkit-gnome? ( gnome-extra/polkit-gnome )
         "

DEPEND=""
BDEPEND=""