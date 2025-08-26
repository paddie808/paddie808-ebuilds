# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cargo

DESCRIPTION="A feature rich terminal file transfer"
HOMEPAGE="https://termscp.veeso.dev"

EGIT_REPO_URI="https://github.com/veeso/termscp.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

IUSE="keyring smb"

DEPEND="dev-libs/openssl
        keyring? ( sys-apps/dbus )
        smb? ( net-fs/samba )
        "
RDEPEND=${DEPEND}

BDEPEND="dev-vcs/git
         sys-devel/gcc
         || ( dev-lang/rust dev-lang/rust-bin )"

src_unpack() {
    git-r3_src_unpack
    cargo_live_src_unpack
}

src_configure() {
        local myfeatures=(
                $(usev smb)
                $(usev keyring)
        )
        cargo_src_configure --no-default-features
}

src_compile() {
    cargo_scr_compile
}