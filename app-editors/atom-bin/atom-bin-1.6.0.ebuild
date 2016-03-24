# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit unpacker eutils

DESCRIPTION="A hackable text editor for the 21st Century"
HOMEPAGE="https://atom.io/"

MY_PN="${PN/-bin/}"
SRC_URI="https://github.com/atom/atom/releases/download/v${PV}/${MY_PN}-amd64.deb"

LICENSE=""
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="mirror"

S="${WORKDIR}"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	cp -R "${S}/usr" "${D}" || die "install failed!"
}
