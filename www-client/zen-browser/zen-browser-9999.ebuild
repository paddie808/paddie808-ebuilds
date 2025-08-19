# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EPYTHON=/usr/bin/python
PYTHON_COMPAT=( python3_{10..13} )

inherit git-r3

FEATURES="-network-sandbox"

DESCRIPTION="Welcome to a calmer internet "
HOMEPAGE="https://zen-browser.app"

EGIT_REPO_URI="https://github.com/zen-browser/desktop.git"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPEND=""
RDEPEND=${DEPEND}

BDEPEND="dev-vcs/git
         net-misc/curl
         dev-lang/python
         dev-python/pip
         net-libs/nodejs"

src_prepare() {
    npm i
    npm run init
    python ./scripts/update_en_US_packs.py
}

src_compile() {
    npm run build
}