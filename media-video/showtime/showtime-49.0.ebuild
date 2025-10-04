# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_13 )

inherit gnome.org gnome2-utils meson python-single-r1 xdg

DESCRIPTION="Watch without distraction"
HOMEPAGE="https://apps.gnome.org/Showtime/"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	${PYTHON_DEPS}
	>=gui-libs/gtk-4.18.0:4
	>=gui-libs/libadwaita-1.8.0:1
	>=media-libs/gstreamer-1.24.11
	>=media-libs/gst-plugins-base-1.24.11
	>=media-libs/gst-plugins-good-1.24.11
	>=media-plugins/gst-plugin-gtk4-0.13.4:1.0
	dev-libs/appstream	
"

DEPEND="${RDEPEND}
"

BDEPEND="
	>=dev-util/blueprint-compiler-0.17
"

pkg_setup() {
	python_setup
}

src_install() {
	meson_src_install
	python_fix_shebang "${D}"/usr/bin/showtime
	python_optimize
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}
