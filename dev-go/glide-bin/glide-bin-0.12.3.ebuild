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

S="${WORKDIR}/linux-amd64"

src_install() {
	local install_path="/opt/${MY_PN}-${PV}"
	insinto "${install_path}"
	doins -r .
	dosym "${install_path}/glide" "/opt/bin/glide"
	fperms +x "${install_path}/glide"
}

