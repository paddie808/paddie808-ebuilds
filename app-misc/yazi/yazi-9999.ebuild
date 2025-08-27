EAPI=8

inherit cargo desktop shell-completion
 
DESCRIPTION="Blazing fast terminal file manager written in Rust, based on async I/O."
HOMEPAGE="https://yazi-rs.github.io"

if [[ "${PV}" = *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/sxyazi/yazi.git"
else
	SRC_URI="https://github.com/sxyazi/${PN^}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
	S="${WORKDIR}/${PN}-source"

	KEYWORDS="~amd64 ~arm64"
fi
 
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm64"
IUSE="7zip chafa fd ffmpeg fzf imagemagick jq poppler ripgrep zoxide cli"
 
DEPEND="sys-apps/file
        7zip? ( app-arch/7zip )
        chafa? ( media-gfx/chafa )
        fd? ( sys-apps/fd )
        ffmpeg? ( media-video/ffmpeg )
        fzf? ( app-shells/fzf )
        imagemagick? ( media-gfx/imagemagick )
        jq? ( app-misc/jq )
        poppler? ( app-text/poppler )
        ripgrep? ( sys-apps/ripgrep )
        zoxide? ( app-shells/zoxide )
        "
RDEPEND="${DEPEND}"
BDEPEND="dev-vcs/git"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_prepare() {
    cargo_gen_config
    export YAZI_GEN_COMPLETIONS=true
    cargo_src_configure --release
    eapply_user
}

src_compile() {
    cargo_src_compile
}

src_install() {
    dobin target/release/yazi

    dobashcomp yazi-boot/completions/yazi.bash
    dofishcomp yazi-boot/completions/yazi.fish
    dozshcomp yazi-boot/completions/_yazi

    if use cli ; then
        dobin target/release/ya

        dobashcomp yazi-cli/completions/ya.bash
        dofishcomp yazi-cli/completions/ya.fish
        dozshcomp yazi-cli/completions/_ya
    fi

    domenu assets/${PN}.desktop
}