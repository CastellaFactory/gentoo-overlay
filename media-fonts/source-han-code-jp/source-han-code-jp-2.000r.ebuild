# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit font

MY_PN="SourceHanCodeJP"
MY_PV=${PV/r/R}
DESCRIPTION="Derivative of Source Han Sans that replaces its proportional Latin glyphs with fixed-width 667-unit glyphs from Source Code Pro"
HOMEPAGE="https://github.com/adobe-fonts/source-han-code-jp/"
SRC_URI="https://github.com/adobe-fonts/${PN}/archive/${MY_PV}.zip -> ${P}.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}/${PN}-${MY_PV}"
RESTRICT="binchecks strip mirror"

DOCS=( README.md )

FONT_SUFFIX="otf"
FONT_S="${S}/OTF"

pkg_postinst (){
	elog 'This fonts will be listed as "源ノ角ゴシック Code JP".'
}
