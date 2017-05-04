# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils

DESCRIPTION="A line oriented search tool that combines the usability of ag with the raw speed of grep(including SIMD and all optimizations)"
HOMEPAGE="https://github.com/BurntSushi/ripgrep"
MY_PN="${PN/-bin/}"
SRC_URI="https://github.com/BurntSushi/${MY_PN}/releases/download/${PV}/${MY_PN}-${PV}-x86_64-unknown-linux-musl.tar.gz"

RESTRICT="mirror"

KEYWORDS="-* ~amd64"
SLOT="0"
LICENSE="MIT Unlicense"

IUSE=""

DEPEND=""

RDEPEND=""

S="${WORKDIR}/${MY_PN}-${PV}-x86_64-unknown-linux-musl"

src_install() {
	insinto /opt/${MY_PN}-${PV}
	doins -r .

	fperms +x /opt/${MY_PN}-${PV}/rg
	dosym /opt/${MY_PN}-${PV}/rg /opt/bin/rg

	# zsh
	insinto "/usr/share/zsh/site-functions"
	newins "complete/_rg" "_rg"
	# fish
	insinto "/usr/share/fish/completions"
	newins "complete/rg.fish" "rg.fish"
}

