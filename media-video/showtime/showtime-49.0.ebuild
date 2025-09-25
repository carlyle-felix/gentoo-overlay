# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit gnome.org gnome2-utils meson xdg

DESCRIPTION="Watch without distraction"
HOMEPAGE="https://apps.gnome.org/Showtime/"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-libs/glib-2.84.3
	>=media-libs/graphene-1.10.8-r1
	>=media-libs/gstreamer-1.24.11
	>=media-libs/gst-plugins-base-1.24.11
	>=media-libs/gst-plugins-good-1.24.11
	>=media-plugins/gst-plugin-gtk4-0.13.4[opengl]
	>=dev-libs/libpeas-2.0.7-r1
	>=gnome-base/gsettings-desktop-schemas-48.0
	>=media-libs/libepoxy-1.5.10-r3
	>=x11-libs/cairo-1.18.4-r1
	>=x11-libs/gdk-pixbuf-2.42.12
	>=dev-libs/gobject-introspection-1.84.0-r1
	>=gui-libs/libadwaita-1.7.6
	>=dev-libs/libportal-0.9.1[gtk]
	>=x11-libs/pango-1.56.4-r1
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
