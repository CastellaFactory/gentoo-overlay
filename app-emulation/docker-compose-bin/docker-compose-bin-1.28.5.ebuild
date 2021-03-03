# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="Define and run multi-container applications with Docker"
HOMEPAGE="https://docs.docker.com/compose/"
MY_PN="${PN%-bin}"
MY_PV="${PV/_/-}"
SRC_URI="https://github.com/docker/compose/releases/download/${MY_PV}/${MY_PN}-Linux-x86_64 -> ${P}-Linux-x86_64"

SLOT="0"
KEYWORDS="-* ~amd64"
DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="installsources mirror strip"

S=${DISTDIR}

src_install() {
	newbin ${P}-Linux-x86_64 ${MY_PN}
}
