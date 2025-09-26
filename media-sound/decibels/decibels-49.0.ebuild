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
	>=dev-libs/gjs-1.54.0
	>=gui-libs/libadwaita-1.8.0
	gui-libs/gtk:4
"
DEPEND="${RDEPEND}
"

BDEPEND="
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
