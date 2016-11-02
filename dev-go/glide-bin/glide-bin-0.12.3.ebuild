# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit unpacker

DESCRIPTION="Package Management for Golang"
HOMEPAGE="https://glide.sh/"
MY_PN="${PN/-bin/}"
SRC_URI="https://github.com/Masterminds/glide/releases/download/v${PV}/${MY_PN}-v${PV}-linux-amd64.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="-* ~amd64"
DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="mirror"

src_unpack() {
	default

	local dir_name
	use amd64 && dir_name=linux-amd64
	use x86 && dir_name=linux-386
	mv "${WORKDIR}/${dir_name}" "${S}" || die
}

src_install() {
	local install_path="/opt/${MY_PN}"
	insinto "${install_path}"
	doins -r *
	dosym "${install_path}/glide" "/usr/bin/glide"
	fperms +x "${install_path}/glide"
}

