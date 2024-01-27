# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit font

MY_PN="Juisee"
DESCRIPTION="Juisse is Japanese programming font which is a composed of Line Seed JP and Julia Mono."
HOMEPAGE="https://github.com/yuru7/juisee"
SRC_URI="
https://github.com/yuru7/${PN}/releases/download/v${PV}/${MY_PN}_v${PV}.zip
https://github.com/yuru7/${PN}/releases/download/v${PV}/${MY_PN}_HW_v${PV}.zip
"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

RESTRICT="binchecks strip mirror"

src_unpack() {
	mkdir $S
	cd $S
	default_src_unpack
}

src_install() {
	insinto /usr/share/fonts/$PN
	doins ${MY_PN}*/*.ttf
}
