EAPI=8

inherit git-r3

DESCRIPTION="Launch Desktop Entries (or arbitrary commands) as Systemd user units, and do it fast."
HOMEPAGE="https://github.com/Vladimir-csp/app2unit"

EGIT_REPO_URI=https://github.com/Vladimir-csp/app2unit.git

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPENDS="x11-libs/libnotify
         app-alternatives/sh
         sys-apps/systemd
         "

RDEPENDS=${DEPENDS}

BDEPENDS="dev-vcs/git
          app-text/sdoc
          "