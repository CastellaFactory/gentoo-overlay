# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

DESCRIPTION="Multiplatform Visual Studio Code from EULA MIT"
HOMEPAGE="https://code.visualstudio.com"
MY_PN="${PN/-bin/}"
SRC_URI="https://vscode-update.azurewebsites.net/${PV}/linux-x64/stable -> ${P}-amd64.tar.gz"
RESTRICT="mirror strip"

LICENSE="EULA MIT"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE=""

DEPEND="
	>=media-libs/libpng-1.2.46
	>=x11-libs/gtk+-2.24.8-r1:2
	x11-libs/cairo
	gnome-base/gconf
	x11-libs/libXtst
"

RDEPEND="
	${DEPEND}
	>=net-print/cups-2.0.0
	x11-libs/libnotify
	x11-libs/libXScrnSaver
"

S="${WORKDIR}/VSCode-linux-x64"

src_install(){
	insinto "/opt/${MY_PN}-${PV}"
	doins -r *
	fperms +x "/opt/${MY_PN}-${PV}/code"
	fperms +x "/opt/${MY_PN}-${PV}/bin/code"
        dosym "/opt/${MY_PN}-${PV}/bin/code" "/opt/bin/vscode"
        fperms +x "/opt/${MY_PN}-${PV}/bin/code"
	fperms +x "/opt/${MY_PN}-${PV}/libnode.so"
	insinto "/usr/share/licenses/${PN}"
	newins "resources/app/LICENSE.txt" "LICENSE"
	make_desktop_entry "vscode" "Visual Studio Code" "/opt/${PN}/resources/app/resources/linux/code.png" "Development;IDE"
}

