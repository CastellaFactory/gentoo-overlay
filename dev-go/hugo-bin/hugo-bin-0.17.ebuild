# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit unpacker

DESCRIPTION="Package Management for Golang"
HOMEPAGE="https://glide.sh/"
MY_PN="${PN/-bin/}"
SRC_URI="https://github.com/spf13/hugo/releases/download/v${PV}/${MY_PN}_${PV}_linux-64bit.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="-* ~amd64"
DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="mirror"

S=${WORKDIR}

src_install() {
	local install_path="/opt/${MY_PN}-${PV}"

	insinto "${install_path}"
	doins -r ${MY_PN}_${PV}_linux_amd64/*
	dosym "${install_path}/hugo_${PV}_linux_amd64" "/usr/bin/hugo"
	fperms +x "${install_path}/hugo_${PV}_linux_amd64"
}

