# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
"

RUST_MIN_VER=1.85.0

inherit cargo meson vala

DESCRIPTION="The Rust image library"
HOMEPAGE="https://gitlab.gnome.org/GNOME/glycin/"
SRC_URI+="https://gitlab.gnome.org/GNOME/glycin/-/archive/${PV}/glycin-${PV}.tar.bz2
		https://github.com/gentoo-crate-dist/glycin/releases/download/${PV}/glycin-${PV}-crates.tar.xz"

LICENSE="MPL-2.0"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD GPL-3+ IJG ISC
	LGPL-3+ MIT Unicode-3.0
	|| ( LGPL-2.1+ MPL-2.0 )
"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	!>=media-libs/glycin-loaders-2:0
	>=dev-libs/glib-2.68.0:2
	>=sys-libs/libseccomp-2.5.0
	media-libs/fontconfig
	media-libs/lcms
	gui-libs/gtk:4
"
DEPEND="
	dev-libs/gobject-introspection
	${RDEPEND}
"

src_prepare() {
	default
	vala_setup
}

src_configure() {
	local emesonargs=(
		-Dglycin-loaders=false
		-Dlibglycin=true
		-Dlibglycin-gtk4=true
		-Dglycin-thumbnailer=false
	)

	meson_src_configure
	ln -s "${CARGO_HOME}" "${BUILD_DIR}/cargo-home" || die
}