# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

MY_PN="rust"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Systems programming language from Mozilla"
HOMEPAGE="http://www.rust-lang.org/"
SRC_URI="amd64? ( http://static.rust-lang.org/dist/${MY_P}-x86_64-unknown-linux-gnu.tar.gz )
	x86? ( http://static.rust-lang.org/dist/${MY_P}-i686-unknown-linux-gnu.tar.gz )"

LICENSE="|| ( MIT Apache-2.0 ) BSD-1 BSD-2 BSD-4 UoI-NCSA"
SLOT="stable"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="!dev-lang/rust:0"
RDEPEND="${DEPEND}"

QA_PREBUILT="
	opt/${MY_P}/bin/rustc
	opt/${MY_P}/bin/rustdoc
	opt/${MY_P}/bin/cargo
	opt/${MY_P}/lib/*.so
	opt/${MY_P}/lib/rustlib/*/lib/*.so
"

src_unpack() {
	default

	local postfix
	use amd64 && postfix=x86_64-unknown-linux-gnu
	use x86 && postfix=i686-unknown-linux-gnu
	mv "${WORKDIR}/${MY_P}-${postfix}" "${S}" || die
}

src_install() {
	./install.sh \
		--disable-verify \
		--prefix="${D}/opt/${MY_P}" \
		--mandir="${D}/usr/share/${MY_P}/man" \
		--disable-ldconfig \
		|| die

	dosym "/opt/${MY_P}/bin/rustc" "/usr/bin/rustc"
	dosym "/opt/${MY_P}/bin/rustdoc" "/usr/bin/rustdoc"
	dosym "/opt/${MY_P}/bin/rust-gdb" "/usr/bin/rust-gdb"
	dosym "/opt/${MY_P}/bin/cargo" "/usr/bin/cargo"

	insinto "/usr/share/zsh/site-functions"
	newins "${S}/cargo/share/zsh/site-functions/_cargo" "_cargo"

	cat <<-EOF > "${T}"/50${MY_P}
	LDPATH="/opt/${MY_P}/lib"
	MANPATH="/usr/share/${MY_P}/man"
	EOF
	doenvd "${T}"/50${MY_P}
}

pkg_postinst() {
	elog "Rust installs a helper script for calling GDB now,"
	elog "for your convenience it is installed under /usr/bin/rust-gdb."

	if has_version 'app-shells/zsh'; then
		elog "zsh completion for rust at 'https://github.com/rust-lang/zsh-config'"
	fi
}

