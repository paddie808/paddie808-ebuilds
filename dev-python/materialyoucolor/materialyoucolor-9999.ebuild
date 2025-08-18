# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..12} )

inherit distutils-r1

DESCRIPTION="Material You color algorithms for python"
HOMEPAGE="https://github.com/T-Dynamos/materialyoucolor-python"

LICENSE="MIT"
SLOT="0"
IUSE=""
REQUIRED_USE=""

BEPEND="
    virtual/pkgconfig
    >=dev-python/cython-0.24.0[${PYTHON_USEDEP}]
"
DEPEND="
	dev-python/Kivy[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"

DISTUTILS_IN_SOURCE_BUILD=

if [[ ${PV} == 9999 ]]; then
	inherit git-r3

	EGIT_REPO_URI="https://github.com/T-Dynamos/materialyoucolor-python.git"
	EGIT_BRANCH="main"
	SRC_URI=""
	KEYWORDS="~amd64 ~arm ~arm64 ~x86"
else
	# Strip all underscores from this package's version (e.g., reduce
	# "2.3.0_rc3" to "2.3.0rc3").
	MY_PV=${PV//_}
    MY_P=${PN}-${MY_PV}
	MY_P2=${MY_PV}/${PN}-${MY_PV}

	#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"
	SRC_URI="https://github.com/T-Dynamos/materialyoucolor-python/releases/download/v${MY_P2}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~x86"

	S="${WORKDIR}/${MY_P}"
fi

python_prepare_all() {
	distutils-r1_python_prepare_all
}

python_compile() {
		distutils-r1_python_compile
}

python_install_all() {
	distutils-r1_python_install_all
}