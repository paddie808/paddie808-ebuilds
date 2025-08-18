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
         sys-apps/edg-desktop-portal-gtk
         gui-apps/hyprpicker
         gui-apps/hypridle
         gui-apps/wl-clipboard
         app-misc/cliphist
         net-wireless/bluez-tools
         sys-fs/inotify-tools
         
         "

DEPEND=""
BDEPEND=""