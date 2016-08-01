# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit unpacker eutils

DESCRIPTION="Everything you need to get started using Heroku"
HOMEPAGE="https://toolbelt.herokuapp.com/"

SRC_URI="https://s3.amazonaws.com/assets.heroku.com/${PN}/${P}.tgz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
DEPEND="dev-lang/ruby"
RDEPEND="${DEPEND}"

RESTRICT="mirror"

S="${WORKDIR}/${PN}"

src_install() {
	local install_path="/opt/${P}"
	insinto "${install_path}"
	doins -r "${S}/."
	dosym "${install_path}/bin/heroku" "/usr/bin/heroku"
	fperms +x "${install_path}/bin/heroku"
}
