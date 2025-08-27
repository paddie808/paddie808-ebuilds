EAPI=8

inherit cargo
 
DESCRIPTION="Drag and Drop utilty written in Rust and GTK4 "
HOMEPAGE="https://github.com/nik012003/ripdrag"

if [[ "${PV}" = *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/nik012003/ripdrag.git"
else
	SRC_URI="https://github.com/nik012003/${PN^}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
	S="${WORKDIR}/${PN}-source"

	KEYWORDS="~amd64 ~arm64"
fi
 
LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm64"
 
DEPEND="gui-libs/gtk
        "
RDEPEND="${DEPEND}"
BDEPEND="dev-vcs/git"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_prepare() {
    cargo_gen_config
    cargo_src_configure --release
    eapply_user
}

src_compile() {
    cargo_src_compile
}

src_install() {
    cargo_src_install
}