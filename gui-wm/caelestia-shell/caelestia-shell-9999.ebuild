# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="The desktop shell for the Caelestia dotfiles"
HOMEPAGE="https://github.com/caelestia-dots/shell"

EGIT_REPO_URI="https://github.com/caelestia-dots/shell.git"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPEND="sys-apps/caelestia-cli
        gui-apps/quickshell
        app-misc/ddcutil
        sys-apps/app2unit
        media-sound/cava
        net-misc/networkmanager
        sys-apps/lm-sensors
        app-shells/fish
        media-libs/aubio
        media-video/pipewire
        sys-libs/glibc
        sys-power/power-profiles-daemon
        gui-apps/grim
        gui-apps/swappy
        sci-libs/libqalculate
        "
RDEPEND=${DEPEND}

BDEPEND="dev-vcs/git
         sys-devel/gcc"

src_compile() {
    cd ${S}/assets
    g++ $CXXFLAGS -std=c++17 -Wall -Wextra -I/usr/include/pipewire-0.3 -I/usr/include/spa-0.2 -I/usr/include/aubio -o beat_detector beat_detector.cpp -lpipewire-0.3 -laubio $LDFLAGS

    wayland-scanner client-header < /usr/share/wayland-protocols/unstable/idle-inhibit/idle-inhibit-unstable-v1.xml > idle-inhibitor.h
    wayland-scanner private-code < /usr/share/wayland-protocols/unstable/idle-inhibit/idle-inhibit-unstable-v1.xml > idle-inhibitor.c
    gcc $CFLAGS -o idle-inhibitor.o -c idle-inhibitor.c
    g++ $CXXFLAGS -o inhibit_idle idle-inhibitor.cpp idle-inhibitor.o -lwayland-client $LDFLAGS
    rm idle-inhibitor.{h,c,o}

    cd ${S}/plugin

    cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DINSTALL_QMLDIR=/usr/lib/qt6/qml
    cmake --build build
}

src_install() {
    cd ${S}
    install -Dm755 ./assets/beat_detector ${D}/usr/lib/caelestia/beat_detector
    rm ./assets/beat_detector

    install -Dm755 ./assets/cpp/inhibit_idle ${D}/usr/lib/caelestia/inhibit_idle
    rm ./assets/cpp/inhibit_idle

    DESTDIR={$D} cmake --install plugin/build
    rm -rf plugin/build

    install -dm755 ${D}/etc/xdg/quickshell/caelestia
    cp -r ./* ${D}/etc/xdg/quickshell/caelestia/
}