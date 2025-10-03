# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit flag-o-matic gnome.org gnome2-utils meson xdg

DESCRIPTION="Parental control support for applications"
HOMEPAGE="https://gitlab.freedesktop.org/pwithnall/malcontent"
SRC_URI="https://gitlab.freedesktop.org/pwithnall/malcontent/-/archive/0.13.1/malcontent-0.13.1.tar.gz"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=sys-apps/dbus-1
	>=sys-auth/polkit-126
	>=dev-util/gi-docgen-2025.3
	>=gui-libs/gtk-4.12
	>=gui-libs/libadwaita-1.6.0
	dev-libs/libglib-testing
"
DEPEND="${RDEPEND}"
BDEPEND="
"

src_configure() {
	local emesonargs=(
		-Dpamlibdir="/lib64/security/"
	)
	meson_src_configure
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}