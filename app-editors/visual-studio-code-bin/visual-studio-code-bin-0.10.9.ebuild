# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit unpacker eutils

DESCRIPTION="Multiplatform Visual Studio Code from Microsoft"
HOMEPAGE="https://code.visualstudio.com"

HASH="db71ac615ddf9f33b133ff2536f5d33a77d4774e"

SRC_URI="
	amd64? ( https://az764295.vo.msecnd.net/stable/${HASH}/VSCode-linux-x64-stable.zip -> VSCode-linux-${PV}-x64.zip )
	x86? ( https://az764295.vo.msecnd.net/stable/${HASH}/VSCode-linux-ia32-stable.zip -> VSCode-linux-${PV}-ia32.zip )
"
LICENSE="Microsoft"
SLOT="0"
KEYWORDS="-* x86 amd64"
DEPEND="gnome-base/gconf
    x11-libs/gtk+:2
    media-libs/libpng"
RDEPEND="${DEPEND}"

RESTRICT="mirror"

S="${WORKDIR}/VSCode-linux-x64"

src_install() {
	insinto "/usr/share/${PN}"
	doins -r *
	dosym "/usr/share/${PN}/Code" "/usr/bin/vscode"
	fperms +x "/usr/share/${PN}/Code"
}
