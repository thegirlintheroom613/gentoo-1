# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit toolchain-funcs

MY_P="${PN}-${PV/_/-}"

DESCRIPTION="Your basic line editor"
HOMEPAGE="https://www.gnu.org/software/ed/"
#SRC_URI="mirror://gnu/ed/${P}.tar.lz"
# Using gzip instead -- the filesize diff is small and lzip uncommon #545344
SRC_URI="https://dev.gentoo.org/~polynomial-c/dist/${MY_P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
[[ "${PV}" == *_rc* ]] || \
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~riscv s390 sparc x86 ~ppc-aix ~x64-cygwin ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

DEPEND="sys-apps/texinfo"
RDEPEND=""

S="${WORKDIR}/${MY_P}"

src_configure() {
	# Upstream configure script is moronic.
	./configure \
		CC="$(tc-getCC)" \
		CFLAGS="${CFLAGS}" \
		LDFLAGS="${LDFLAGS}" \
		CPPFLAGS="${CPPFLAGS}" \
		--bindir="${EPREFIX}/bin" \
		--prefix="${EPREFIX}/usr"
}
