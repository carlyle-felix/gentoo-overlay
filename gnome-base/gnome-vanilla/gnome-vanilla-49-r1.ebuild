# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Meta package for a vanilla GNOME experience on Gentoo"
HOMEPAGE="https://www.gnome.org/"
LICENSE="metapackage"
SLOT="0"
IUSE="browser +webkit +webcam +previewer"
KEYWORDS="~amd64 ~arm64"
RDEPEND="
	>=app-editors/gnome-text-editor-49.0
	webcam? (
		>=media-video/snapshot-49.0
	)
	>=gnome-base/dconf-0.49.0
	>=gnome-base/gdm-49.0.1
	>=gnome-base/gnome-session-49.0
	>=gnome-base/gnome-shell-49.0
	>=gnome-base/gsettings-desktop-schemas-49.0
	>=gnome-base/gvfs-1.58.0
	|| ( 
		webkit? ( >=gnome-base/nautilus-49.0[previewer?] )
		>=gnome-base/nautilus-49.0[-previewer]
	)
	>=gnome-extra/gnome-calculator-48.0
	>=gnome-extra/gnome-calendar-49.0
	>=gnome-extra/gnome-characters-49.0
	>=gnome-extra/gnome-clocks-49.0
	>=gnome-extra/gnome-contacts-49.0
	=gnome-extra/gnome-shell-extensions-49.0
	>=gnome-extra/gnome-software-49.0
	>=gnome-extra/gnome-weather-49.0
	>=gnome-extra/gnome-system-monitor-49.0
	>=gui-libs/gtk-4.20.1
	>=media-gfx/loupe-49.0
	>=media-libs/gst-plugins-base-1.24.11-r1
	>=media-libs/gst-plugins-good-1.24.11
	>=media-libs/gstreamer-1.24.11
	>=media-sound/decibels-49.0
	>=media-video/showtime-49.0
	webkit? (
		>=net-libs/webkit-gtk-2.48
		browser? (
			>=www-client/epiphany-49.0
		)
		>=gnome-extra/sushi-46.0
		>=gnome-extra/yelp-49.0
	)
	>=sys-apps/gnome-disk-utility-46.1-r1
	>=x11-libs/gtk+-3.24
	>=x11-terms/ptyxis-49.0
	>=x11-themes/gnome-backgrounds-49.0
	>=gnome-base/gnome-control-center-49.0
	>=media-gfx/gnome-font-viewer-49.0
	>=gnome-base/gnome-keyring-48.0
	>=net-misc/gnome-remote-desktop-49.0
	>=net-misc/gnome-connections-49.0
	>=gnome-base/gnome-settings-daemon-49.0
	>=gnome-extra/gnome-user-docs-49.0
	>=sys-apps/xdg-desktop-portal-gnome-48.0
	>=x11-misc/xdg-user-dirs-gtk-0.14
	>=dev-libs/glib-2.86.0
	>=sys-apps/baobab-49.0
	>=dev-util/sysprof-49.0
	>=gnome-extra/tecla-49.0
	>=sci-geosciences/gnome-maps-49.0
	>=media-libs/grilo-0.3.19
	>=media-plugins/grilo-plugins-0.3.18
	>=media-gfx/simple-scan-49.0
	>=app-misc/localsearch-3.10.0
"
