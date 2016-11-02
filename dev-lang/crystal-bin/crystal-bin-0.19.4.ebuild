# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit unpacker eutils

DESCRIPTION="The Crystal programming language"
HOMEPAGE="http://crystal-lang.org/"
MY_PN="${PN/-bin/}"
MY_PV="${PV}-1"
SRC_URI="https://github.com/crystal-lang/crystal/releases/download/${PV}/${MY_PN}-${MY_PV}-linux-x86_64.tar.gz -> ${P}-x86_64.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="mirror"

S=${WORKDIR}

src_install() {
	local install_path="/opt/${MY_PN}-${MY_PV}"
	insinto "${install_path}"
	doins -r "${S}/${MY_PN}-${MY_PV}/."
	fperms +x "${install_path}/bin/crystal"
	fperms +x "${install_path}/embedded/bin/crystal"
	fperms +x "${install_path}/embedded/bin/pcregrep"
	fperms +x "${install_path}/embedded/bin/pcretest"
	fperms +x "${install_path}/embedded/bin/shards"
	dosym "${install_path}/bin/crystal" "/usr/bin/crystal"
	dosym "${install_path}/embedded/bin/shards" "/usr/bin/shards"
	insinto "/usr/share/zsh/site-functions"
	newins "${S}/${MY_PN}-${MY_PV}/etc/completion.zsh" "_crystal"
}
