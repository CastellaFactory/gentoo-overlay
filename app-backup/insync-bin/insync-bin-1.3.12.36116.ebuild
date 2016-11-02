# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit rpm

DESCRIPTION="Advanced cross-platform Google Drive client"
HOMEPAGE="https://www.insynchq.com/"
SRC_URI="http://s.insynchq.com/builds/insync-${PV}-fc21.x86_64.rpm"

SLOT="0"
KEYWORDS="-* ~amd64"
DEPEND="dev-libs/libevent media-libs/libwebp"
RDEPEND="${DEPEND}"

RESTRICT="mirror"

S=${WORKDIR}

src_unpack() {
	rpm_src_unpack ${A}
}

src_install() {
	cp -pPR "${S}"/{usr,etc} "${D}"/ || die "Installation failed"

	echo "SEARCH_DIRS_MASK=\"/usr/lib*/insync\"" > "${T}/70${PN}" || die
	insinto "/etc/revdep-rebuild" && doins "${T}/70${PN}" || die
}

pkg_postinst() {
	elog "To automatically start insync add 'insync start' to your session"
}
