# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit unpacker

DESCRIPTION="The Teensy Loader program communicates with your Teensy board when the HalfKay bootloader is running"
HOMEPAGE="https://www.pjrc.com/teensy/loader.html"

MY_PN="${PN/-bin/}"
SRC_URI="https://www.pjrc.com/teensy/teensy.64bit.gz"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE=""

DEPEND="dev-libs/libusb-compat"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

RESTRICT="mirror"

src_install() {
	local ins_path="/opt/${MY_PN}-${PV}"
	insinto "${ins_path}"
	doins "${S}/teensy.64bit"
	fperms +x "${ins_path}/teensy.64bit"
	dosym "${ins_path}/teensy.64bit" "/usr/bin/teensy"
}

