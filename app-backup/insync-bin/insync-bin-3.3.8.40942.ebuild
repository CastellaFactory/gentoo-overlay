# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit rpm xdg-utils

DESCRIPTION="Advanced cross-platform Google Drive client"
HOMEPAGE="https://www.insynchq.com/"
SRC_URI="https://d2t3ff60b2tol4.cloudfront.net/builds/insync-${PV}-fc30.x86_64.rpm"

SLOT="0"
KEYWORDS="-* ~amd64"
DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="mirror strip"

S=${WORKDIR}

PATCHES=(
    "${FILESDIR}/insync-3.3.2-lib64.patch"
    "${FILESDIR}/insync-3.3.2-ca-path.patch"
)

src_unpack() {
    rpm_src_unpack ${A}
}

src_install() {
    cp -pPR "${S}"/usr "${D}"/ || die "Installation failed"
    mv "${D}"/usr/lib "${D}"/usr/lib64
    rm -Rf "${D}"/usr/lib64/.build-id
    gunzip "${D}"/usr/share/man/man1/insync.1.gz
}

pkg_postinst() {
    xdg_desktop_database_update
    xdg_mimeinfo_database_update
    xdg_icon_cache_update
}

pkg_postrm() {
    xdg_desktop_database_update
    xdg_mimeinfo_database_update
    xdg_icon_cache_update
}

pkg_postinst() {
    elog "To automatically start insync add 'insync start' to your session"
}
