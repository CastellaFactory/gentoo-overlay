# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit unpacker eutils

DESCRIPTION="The extensible, open source mail client"
HOMEPAGE="https://www.nylas.com/n1"
SRC_URI="https://edgehill.s3-us-west-2.amazonaws.com/${PV}-53cd69b/linux-deb/x64/N1.deb -> N1-${PV}.dev"
SLOT="0"
KEYWORDS="-* ~amd64"
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
	sed -i -e 's/Categories=.*/Categories=GNOME;GTK;Network;Utility;/' "${S}/usr/share/applications/nylas.desktop"
	rm "${S}/usr/bin/nylas"
	cp -R "${S}/usr" "${D}" || die "install failed!"
	dosym "/usr/share/nylas/nylas" "/usr/bin/nylas"
}
