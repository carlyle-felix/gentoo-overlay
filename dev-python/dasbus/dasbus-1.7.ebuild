# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1 pypi

DESCRIPTION="DBus library in Python 3"
HOMEPAGE="https://github.com/rhinstaller/dasbus"
SRC_URI="https://github.com/dasbus-project/dasbus/releases/download/v1.7/dasbus-1.7.tar.gz"

LICENSE="LGPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	${PYTHON_DEPS}
    dev-python/pygobject:3[${PYTHON_USEDEP}]
"

DEPEND="${RDEPEND}
"

distutils_enable_tests pytest
