# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake

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
        dev-libs/wayland
        app-shells/bash
        dev-qt/qtbase
        dev-qt/qtdeclarative
        "
RDEPEND=${DEPEND}

BDEPEND="dev-vcs/git
         sys-devel/gcc
         dev-libs/wayland-protocols
         dev-build/cmake
         dev-build/ninja"

# src_prepare() {
#     cmake_src_prepare
# }

# src_configure() {
#     local mycmakeargs=(
#                 -DCMAKE_BUILD_TYPE=Release -DINSTALL_QMLDIR=/usr/lib/qt6/qml
#         )
#         cmake_src_configure
# }

src_compile() {
    cd ${S}

    cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/
    cmake --build build
}

src_install() {
    cd ${S}
    
    DESTDIR=${D} cmake --install build
    install -Dm644 LICENSE ${D}/usr/share/licenses/${PN}/LICENSE
}