# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit gnome.org gnome2-utils meson xdg

DESCRIPTION="Play audio files"
HOMEPAGE="https://apps.gnome.org/Decibels/"
LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=media-libs/graphene-1.10.8-r1
	>=media-libs/gstreamer-1.24.11
	>=media-libs/gst-plugins-base-1.24.11
	>=media-libs/gst-plugins-good-1.24.11
	>=media-plugins/gst-plugin-gtk4-0.13.4[opengl]
	>=gnome-base/gsettings-desktop-schemas-48.0
	>=dev-libs/gobject-introspection-1.84.0-r1
	>=gui-libs/libadwaita-1.7.6
"
DEPEND="${RDEPEND}
"

BDEPEND="
	>=dev-build/meson-1.7.2
	>=dev-util/blueprint-compiler-0.16.0
	>=dev-lang/typescript-5.9.2
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
