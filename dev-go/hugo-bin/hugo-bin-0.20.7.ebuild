# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit unpacker

DESCRIPTION="A Fast and Flexible Static Site Generator built with love in GoLang"
HOMEPAGE="http://gohugo.io/"
MY_PN="${PN/-bin/}"
SRC_URI="https://github.com/spf13/hugo/releases/download/v${PV}/${MY_PN}_${PV}_Linux-64bit.tar.gz"
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
	doins -r .
	dosym "${install_path}/hugo" "/opt/bin/hugo"
	fperms +x "${install_path}/hugo"
}

