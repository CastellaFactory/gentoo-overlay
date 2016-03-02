# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit unpacker eutils

DESCRIPTION="A messaging app for teams that is on a mission to make your working life simpler, more pleasant, and more pruductive"
HOMEPAGE="https://slack.com/"

SRC_URI_AMD64="https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-${PV}-amd64.deb"
SRC_URI_X86="https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-${PV}-i386.deb"
SRC_URI="
	amd64? ( ${SRC_URI_AMD64} )
	x86? ( ${SRC_URI_X86} )
"

SLOT="0"
KEYWORDS="-* x86 amd64"
DEPEND="gnome-base/gconf
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
	cp -R "${WORKDIR}/usr" "${D}" || die "install failed!"
}
