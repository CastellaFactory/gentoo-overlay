# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit unpacker eutils

DESCRIPTION="Multiplatform Visual Studio Code from Microsoft"
HOMEPAGE="https://code.visualstudio.com"
HASH="6276dcb0ae497766056b4c09ea75be1d76a8b679"
MY_PN="${PN/-bin/}"

SRC_URI="
	amd64? ( https://az764295.vo.msecnd.net/stable/${HASH}/VSCode-linux-x64-stable.zip -> VSCode-linux-${PV}-x64.zip )
	x86? ( https://az764295.vo.msecnd.net/stable/${HASH}/VSCode-linux-ia32-stable.zip -> VSCode-linux-${PV}-ia32.zip )
"
LICENSE="Microsoft"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
DEPEND="gnome-base/gconf
	x11-libs/gtk+:2
	media-libs/libpng"
RDEPEND="${DEPEND}"

RESTRICT="mirror"

src_unpack() {
	default

	local postfix
	use amd64 && postfix=linux-x64
	use x86 && postfix=linux-ia32

	mv "${WORKDIR}/VSCode-${postfix}" "${S}" || die
}

src_install() {
	insinto "/usr/share/${MY_PN}"
	doins -r *
	dosym "/usr/share/${MY_PN}/code" "/usr/bin/vscode"
	fperms +x "/usr/share/${MY_PN}/code"
	make_desktop_entry "vscode %U" "Visual Studio Code" "/usr/share/${MY_PN}/resources/app/resources/linux/code.png" "Development"
}
