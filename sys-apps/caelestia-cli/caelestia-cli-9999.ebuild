# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EPYTHON=/usr/bin/python
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..13} )

inherit git-r3 distutils-r1 shell-completion

DESCRIPTION="The main cli for the Caelestia dotfiles"
HOMEPAGE="https://github.com/caelestia-dots/cli"

EGIT_REPO_URI="https://github.com/caelestia-dots/cli.git"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPEND="dev-lang/python
        dev-python/pillow
        dev-python/materialyoucolor
        x11-libs/libnotify
        gui-apps/swappy
        gui-apps/grim
        dev-ruby/sass
        sys-apps/app2unit
        gui-apps/wl-clipboard
        gui-apps/slurp
        gnome-base/dconf
        media-libs/libpulse
        "
RDEPEND=${DEPEND}

BDEPEND="dev-vcs/git
         dev-python/installer"

src_compile() {
    disutils-r1_python_compile
}

src_install() {
    python -m installer --destdir="${D}" dist/*.whl || die
    dofishcomp completions/caelestia.fish
}