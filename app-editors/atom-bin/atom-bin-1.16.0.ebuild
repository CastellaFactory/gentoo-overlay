# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils

DESCRIPTION="A hackable text editor for the 21st Century - Binary package"
HOMEPAGE="https://atom.io"
MY_PN="${PN/-bin/}"
SRC_URI="https://github.com/${MY_PN}/${MY_PN}/releases/download/v${PV}/${MY_PN}-amd64.tar.gz -> ${MY_PN}-amd64-${PV}.tar.gz"

RESTRICT="mirror strip"

KEYWORDS="-* ~amd64"
SLOT="0"
LICENSE="MIT"

IUSE=""

DEPEND="media-fonts/inconsolata
	!app-editors/atom"

RDEPEND="${DEPEND}
	x11-libs/gtk+:2
	x11-libs/libnotify
	gnome-base/libgnome-keyring
	dev-libs/nss
	dev-libs/nspr
	gnome-base/gconf
	media-libs/alsa-lib
	net-print/cups
	sys-libs/libcap
	x11-libs/libXtst
	x11-libs/pango"

S="${WORKDIR}/${MY_PN}-${PV}-amd64"

src_install() {
	insinto /opt/${MY_PN}-${PV}
	doins -r .
	dosym /opt/${MY_PN}-${PV}/atom /opt/bin/atom
	dosym /opt/${MY_PN}-${PV}/resources/app/apm/bin/apm /opt/bin/apm

	fperms +x /opt/${MY_PN}-${PV}/atom
	fperms +x /opt/${MY_PN}-${PV}/resources/app/${MY_PN}.sh
	fperms +x /opt/${MY_PN}-${PV}/resources/app/apm/bin/apm
        fperms +x /opt/${MY_PN}-${PV}/resources/app/apm/bin/node
        fperms +x /opt/${MY_PN}-${PV}/resources/app/apm/bin/npm
	fperms +x /opt/${MY_PN}-${PV}/resources/app/apm/node_modules/npm/bin/node-gyp-bin/node-gyp
	fperms +x /opt/${MY_PN}-${PV}/resources/app.asar.unpacked/node_modules/symbols-view/vendor/ctags-linux

	make_desktop_entry "atom" "Atom" "/opt/${MY_PN}-${PV}/${MY_PN}.png" \
		"GNOME;GTK;Utility;TextEditor;Development;" \
		"GenericName=Text Editor\nMimeType=text/plain;\nStartupNotify=true\nStartupWMClass=${MY_PN}"
}

