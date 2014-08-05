# Maintainer: t3kk3n (corp@hush.ai)
# In close relation to, and fixes found at https://aur.archlinux.org/packages/elfsh-svn

pkgname=eresi-bin-svn
_pkgname=eresi
pkgver=6
pkgrel=1
pkgdesc="The ERESI Reverse Engineering Software Interface is a multi-architecture binary analysis framework with a domain-specific language tailored to reverse engineering and program manipulation."
url="http://www.eresi-project.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('openssl' 'bash')
makedepends=('subversion')
provides=($_pkgname)
conflicts=('elfsh-svn')
source=()
md5sums=()

_svnmod="$_pkgname"
_svntrunk="http://svn.eresi-project.org/svn/trunk/"

build() {

  cd "${srcdir}"

  msg "Retrieving sources..."

  svn co "${_svntrunk}" "${_svnmod}"
  
  cd "${_svnmod}"

  msg "Building..."

  opts=" --enable-32-64 --enable-readline --libasm-ia32 --libasm-sparc --libasm-mips --libasm-arm "
  [ "$CARCH" = "x86_64" ] && opts="${opts} --enable-m64 "

  sed -i '/which gmake/c\$(which gmake 1>/dev/null 2>/dev/null); tmpst1=$?; if [ $tmpst1 -ne 0 ]; then' configure
	
  ./configure ${opts} --prefix /usr

  sed -i 's/^sed/#sed/' Makefile
  sed -i 's!__unbounded!!g;' libe2dbg/user/entry.c

  make -j4

}

package() {
  cd "${srcdir}"/$_pkgname
	make install DESTDIR="${pkgdir}"/usr
}

