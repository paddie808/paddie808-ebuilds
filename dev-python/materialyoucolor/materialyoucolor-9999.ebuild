# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=no
PYTHON_COMPAT=( python3_{10..13} )

inherit git-r3 distutils-r1 shell-completion

DESCRIPTION="Material You color algorithms for python!"
HOMEPAGE="https://github.com/T-Dynamos/materialyoucolor-python"

EGIT_REPO_URI="https://github.com/T-Dynamos/materialyoucolor-python.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPEND=""
RDEPEND=${DEPEND}

BDEPEND="dev-vcs/git"

src_install() {
    esetup.py
}
