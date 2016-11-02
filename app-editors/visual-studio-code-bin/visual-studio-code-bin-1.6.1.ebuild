# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit unpacker eutils
DESCRIPTION="Multiplatform Visual Studio Code from Microsoft"
HOMEPAGE="https://code.visualstudio.com"
MY_PN="${PN/-bin/}"

SRC_URI="https://az764295.vo.msecnd.net/stable/9e4e44c19e393803e2b05fe2323cf4ed7e36880e/code-stable-code_1.6.1-1476373175_amd64.tar.gz"
LICENSE="Microsoft"
SLOT="0"
KEYWORDS="-* ~amd64"
DEPEND="gnome-base/gconf
	x11-libs/gtk+:2
	media-libs/libpng"
RDEPEND="${DEPEND}"

RESTRICT="mirror"

src_unpack() {
	default

	mv "${WORKDIR}/VSCode-linux-x64" "${S}" || die
}

src_install() {
	insinto "/usr/share/${MY_PN}"
	doins -r *
	dosym "/usr/share/${MY_PN}/code" "/usr/bin/vscode"
	fperms +x "/usr/share/${MY_PN}/code"
	make_desktop_entry "vscode %U" "Visual Studio Code" "/usr/share/${MY_PN}/resources/app/resources/linux/code.png" "Development"
}
