# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit unpacker eutils

DESCRIPTION="The Crystal programming language"
HOMEPAGE="http://crystal-lang.org/"
MY_PN="${PN/-bin/}"
MY_PV="${PV}-1"
SRC_URI="
	amd64? ( https://github.com/crystal-lang/crystal/releases/download/${PV}/${MY_PN}-${MY_PV}-linux-x86_64.tar.gz -> ${P}-x86_64.tar.gz )
	x86? ( https://github.com/crystal-lang/crystal/releases/download/${PV}/${MY_PN}-${MY_PV}-linux-i686.tar.gz -> ${P}-i686.tar.gz )
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="mirror"

S=${WORKDIR}

src_install() {
    INSTALL_PATH="/opt/${MY_PN}-${MY_PV}"
    insinto "${INSTALL_PATH}"
    doins -r "${WORKDIR}/${MY_PN}-${MY_PV}/."
    fperms +x "${INSTALL_PATH}/bin/crystal"
    fperms +x "${INSTALL_PATH}/embedded/bin/crystal"
    fperms +x "${INSTALL_PATH}/embedded/bin/pcregrep"
    fperms +x "${INSTALL_PATH}/embedded/bin/pcretest"
    fperms +x "${INSTALL_PATH}/embedded/bin/shards"
	dosym "${INSTALL_PATH}/bin/crystal" "/usr/bin/crystal"
    insinto "/usr/share/zsh/site-functions"
    newins "${WORKDIR}/${MY_PN}-${MY_PV}/etc/completion.zsh" "_crystal"
}
