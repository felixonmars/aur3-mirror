# Maintainer: Manalishi <manalishi at freenet dot de>
pkgname=cbmbasic-svn
_pkgname="${pkgname%-*}"
pkgver=18
pkgrel=4
pkgdesc="A 100% compatible version of Commodore's version of Microsoft BASIC 6502."
arch=('i686' 'x86_64')
url="http://cbmbasic.sourceforge.net/"
license=('BSD')
makedepends=('subversion')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=( "Makefile.diff"
	 "LICENSE" )
md5sums=('2e34310f93eeb1a95f9b084f7c21598f'
         '9cf04f76f29acab7288c1148ca3cd1dc')

_svnmod="${_pkgname}"
_svntrunk="https://cbmbasic.svn.sourceforge.net/svnroot/${_svnmod}/trunk"

build() {
  cd "${srcdir}/"

  if [ -d ${_svnmod} ]; then
    msg "Updating local SVN repository."
    (cd ${_svnmod} && svn up)
    msg "SVN update done or server timeout."
  else
    msg "Checking out SVN repository."
    svn co "${_svntrunk}" "${_svnmod}"
    msg "SVN checkout done or server timeout."
  fi

  msg "Starting make process."

  rm -rf "${_svnmod}-build/"
  cp -r "${_svnmod}" "${_svnmod}-build"
  cd "${_svnmod}-build/"
  patch -uN Makefile ../Makefile.diff || return 1
  make || return 1
}

package() {
  cd "${srcdir}/"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_svnmod}/LICENSE" || return 1

  cd "${srcdir}/${_svnmod}-build/"
  install -D cbmbasic "${pkgdir}/usr/bin/cbmbasic" || return 1
  install -D -m644 README.txt "${pkgdir}/usr/share/${_svnmod}/README.txt" || return 1

  cd "${srcdir}/${_svnmod}-build/test"
  install -D -m644 color.bas "${pkgdir}/usr/share/${_svnmod}/test/color.bas" || return 1
  install -D -m644 fileeof.bas "${pkgdir}/usr/share/${_svnmod}/test/fileeof.bas" || return 1
  install -D -m644 fileio.bas "${pkgdir}/usr/share/${_svnmod}/test/"fileio.bas || return 1
  install -D -m644 get.bas "${pkgdir}/usr/share/${_svnmod}/test/get.bas" || return 1
  install -D -m644 plot.bas "${pkgdir}/usr/share/${_svnmod}/test/plot.bas" || return 1
  install -D -m644 sieve.bas "${pkgdir}/usr/share/${_svnmod}/test/sieve.bas" || return 1
  install -D -m644 test_console.bas "${pkgdir}/usr/share/${_svnmod}/test/test_console" || return 1
}
