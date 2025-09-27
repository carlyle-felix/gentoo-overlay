# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_13 )
inherit gnome.org gnome2-utils meson xdg

DESCRIPTION="Watch without distraction"
HOMEPAGE="https://apps.gnome.org/Showtime/"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="+gstreamer +python"
REQUIRED_USE="gstreamer python"

RDEPEND="
	>=gui-libs/gtk-4.18.0
	>=gui-libs/libadwaita-1.7.6
	gstreamer? (
		>=media-libs/gstreamer-1.24.11
		>=media-libs/gst-plugins-base-1.24.11
		>=media-libs/gst-plugins-good-1.24.11
	)
	python? ( >=dev-lang/python-3.13 )
"

DEPEND="${RDEPEND}
"

BDEPEND="
	>=dev-util/blueprint-compiler-0.16.0
"
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
