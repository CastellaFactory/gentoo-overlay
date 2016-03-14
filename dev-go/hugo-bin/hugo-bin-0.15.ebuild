# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit unpacker

DESCRIPTION="Package Management for Golang"
HOMEPAGE="https://glide.sh/"
MY_PN="${PN/-bin/}"
MY_P="${MY_PN}-${PV}"
SRC_URI="
	x86?	  ( https://github.com/spf13/hugo/releases/download/v${PV}/${MY_PN}_${PV}_linux_386.tar.gz )
	amd64?	  ( https://github.com/spf13/hugo/releases/download/v${PV}/${MY_PN}_${PV}_linux_amd64.tar.gz )
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="mirror"

src_unpack() {
	default

	local dir_name
	use amd64 && postfix="linux_amd64"
	use x86 && postfix="linux_386"
	mv "${WORKDIR}/${MY_PN}_${PV}_${postfix}" "${S}" || die
}

src_install() {
	local install_path="/opt/${MY_PN}"
	local dir_name
	use amd64 && postfix="linux_amd64"
	use x86 && postfix="linux_386"

	insinto "${install_path}"
	doins -r *
	dosym "${install_path}/hugo_${PV}_${postfix}" "/usr/bin/hugo"
	fperms +x "${install_path}/hugo_${PV}_${postfix}"
}

