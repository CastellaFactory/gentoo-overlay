# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI=5

inherit rpm eutils

MY_PN="dmd"
MY_P="${MY_PN}-${PV}"

SRC_URI="
	amd64? ( http://downloads.dlang.org/releases/2.x/${PV}/${MY_P}-0.fedora.x86_64.rpm )
	x86? ( http://downloads.dlang.org/releases/2.x/${PV}/${MY_P}-0.fedora.i386.rpm )
"
DESCRIPTION="Reference compiler for the D programming language"
HOMEPAGE="http://dlang.org/"
KEYWORDS="x86 amd64"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

RESTRICT="mirror"

S=${WORKDIR}

src_unpack() {
	rpm_src_unpack ${A}
}

src_install() {
	sed -i -e "s/\/usr/\/opt\/${MY_P}\/usr/g" "${S}/etc/dmd.conf"

	local install_path="/opt/${MY_P}"
	insinto "${install_path}"
	doins -r "${S}/."
	dosym "${install_path}/etc/dmd.conf" "/etc/dmd.conf"
	dosym "${install_path}/usr/bin/ddemangle" "/usr/bin/ddemangle"
	dosym "${install_path}/usr/bin/dman" "/usr/bin/dman"
	dosym "${install_path}/usr/bin/dmd" "/usr/bin/dmd"
	dosym "${install_path}/usr/bin/dumpobj" "/usr/bin/dumpobj"
	dosym "${install_path}/usr/bin/dustmite" "/usr/bin/dustmite"
	dosym "${install_path}/usr/bin/obj2asm" "/usr/bin/obj2asm"
	dosym "${install_path}/usr/bin/rdmd" "/usr/bin/rdmd"

	fperms +x "${install_path}/usr/bin/ddemangle"
	fperms +x "${install_path}/usr/bin/dman"
	fperms +x "${install_path}/usr/bin/dmd"
	fperms +x "${install_path}/usr/bin/dumpobj"
	fperms +x "${install_path}/usr/bin/dustmite"
	fperms +x "${install_path}/usr/bin/obj2asm"
	fperms +x "${install_path}/usr/bin/rdmd"
}
