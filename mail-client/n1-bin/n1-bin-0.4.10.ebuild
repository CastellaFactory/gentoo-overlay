# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit unpacker eutils

DESCRIPTION="The extensible, open source mail client"
HOMEPAGE="https://www.nylas.com/n1"
SRC_URI="https://edgehill.s3-us-west-2.amazonaws.com/${PV}-4e3595b/linux-deb/x64/N1.deb"

SLOT="0"
KEYWORDS="-* amd64"
DEPEND="dev-vcs/git
	gnome-base/gconf
	x11-libs/gtk+:2
	virtual/udev
	dev-libs/libgcrypt
	x11-libs/libnotify
	x11-libs/libXtst
	dev-libs/nss
	dev-lang/python
	x11-misc/xdg-utils"
RDEPEND="${DEPEND}"

RESTRICT="mirror"

S="${WORKDIR}"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	rm "${WORKDIR}/usr/bin/nylas"
	cp -R "${WORKDIR}/usr" "${D}" || die "install failed!"
	dosym "/usr/share/nylas/nylas" "/usr/bin/nylas"
}