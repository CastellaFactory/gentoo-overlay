# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI=5

inherit eutils

MY_PN="ldc2"
MY_P="${MY_PN}-${PV}"

SRC_URI="
	amd64? ( https://github.com/ldc-developers/ldc/releases/download/v${PV}/${MY_P}-linux-x86_64.tar.gz )
	x86? ( https://github.com/ldc-developers/ldc/releases/download/v${PV}/${MY_P}-linux-x86.tar.gz )
"

DESCRIPTION="LLVM D Compiler"
HOMEPAGE="https://ldc-developers.github.com/ldc"
KEYWORDS="x86 amd64"
LICENSE="BSD"
SLOT="0"
IUSE=""

RESTRICT="mirror"

RDEPEND=""
DEPEND="${RDEPEND}"

src_unpack() {
	default

	local postfix
	use amd64 && postfix=linux-x86_64
	use x86 && postfix=linux-x86

	mv "${WORKDIR}/${MY_P}-${postfix}" "${S}" || die
}

src_install() {
	local install_path="/opt/${MY_P}"
	insinto "${install_path}"
	doins -r "${S}/."
	dosym "${install_path}/bin/ldc2" "/usr/bin/ldc2"
	dosym "${install_path}/bin/ldmd2" "/usr/bin/ldmd2"

	fperms +x "${install_path}/bin/ldc2"
	fperms +x "${install_path}/bin/ldmd2"
}
