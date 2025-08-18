EAPI=8

inherit cargo desktop
 
DESCRIPTION="Blazing fast terminal file manager written in Rust, based on async I/O."
HOMEPAGE="https://yazi-rs.github.io"

if [[ "${PV}" = *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/sxyazi/yazi.git"
else
	SRC_URI="https://github.com/sxyazi/${PN^}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
	S="${WORKDIR}/${PN}-source"

	KEYWORDS="~amd64"
fi
 
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="7zip chafa fd ffmpeg fzf imagemagik jq poppler ripgrep zoxide"
 
DEPEND="sys-app/file
        7zip? ( app-arch/7zip )
        chafa? ( media-gfx/chafa )
        fd? ( sys-app/fd )
        ffmpeg? ( media-video/ffmpeg )
        fzf? ( app-shells/fzf )
        imagemagik? ( media-gfx/imagemagik )
        jq? ( app-misc/jq )
        poppler? ( app-text/poppler )
        ripgrep? ( sys-apps/ripgrep )
        zoxide? ( app-shells/zoxide )
        "
RDEPEND="${DEPEND}"
BDEPEND="dev-vcs/git"

src_compile() {
    cargo_src_compile
}

src_install() {
    dobin "$(cargo_target_dir)/${PN}"

    domenu assets/${PN}.desktop
}