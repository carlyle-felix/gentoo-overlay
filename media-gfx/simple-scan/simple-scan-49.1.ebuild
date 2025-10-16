# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..13} )
inherit gnome.org gnome2-utils meson python-any-r1 vala xdg

DESCRIPTION="Simple document scanning utility"
HOMEPAGE="https://gitlab.gnome.org/GNOME/simple-scan"
LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPEND="
	>=dev-libs/glib-2.38:2
	>=gui-libs/gtk-4.10.0:4
	>=gui-libs/libadwaita-1.2.0:1
	>=sys-libs/zlib-1.2.3.1:=
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	>=dev-libs/libgusb-0.2.7
	>=x11-misc/colord-0.1.24:=[udev(+)]
	media-libs/libwebp:=
	>=media-gfx/sane-backends-1.0.20
"
RDEPEND="${DEPEND}
	x11-misc/xdg-utils
"
BDEPEND="
	${PYTHON_DEPS}
	$(vala_depend)
	dev-libs/libxml2:2
	dev-util/itstool
	>=sys-devel/gettext-0.19.8
	virtual/pkgconfig
	gui-libs/libadwaita:1[vala]
	dev-libs/libgusb[vala]
	x11-misc/colord[vala]
"

src_prepare() {
	default
	vala_setup
	xdg_environment_reset
}

src_configure() {
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
