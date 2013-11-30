# Maintainer: perlawk 

pkgname=elfsh-svn
_pkgname=elfsh
pkgver=0.83a1
pkgrel=1
pkgdesc="The ELF shell is an interactive, modular, independent, unified and scriptable ELF (Executable & Linking Format) machine designed for executable files, shared libraries and relocatable ELF objects manipulation."
url="http://elfsh.asgardlabs.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('openssl' 'bash')
makedepends=('subversion')
provides=($_pkgname)
source=()
md5sums=()

_svnmod="$_pkgname"
_svntrunk="http://svn.eresi-project.org/svn/trunk/"

build() {
  cd "${srcdir}"

  msg "Getting sources..."
  svn co "${_svntrunk}" "${_svnmod}"
  cd "${_svnmod}"

  msg "Building..."

	opts=" --enable-32-64 --enable-readline --libasm-ia32 --libasm-mips --libasm-arm "
	[ "$CARCH" = "x86_64" ] && opts="${opts} --enable-m64"

  ./configure ${opts} --prefix /usr

	sed -i 's/^sed/#sed/' Makefile
	sed -i 's!__unbounded!!g;' libe2dbg/user/entry.c
  make -j4
}

package() {
  cd "${srcdir}"/$_pkgname
	echo in install 100
	make install DESTDIR="${pkgdir}"/usr
}

