# Maintainer: Manalishi <manalishi at freenet dot de>

pkgname=pwman-svn
_pkgname="${pkgname%-*}"
pkgver=125
pkgrel=2
pkgdesc="A text-based application for securely storing and managing passwords"
arch=('i686 x86_64')
url="http://pwman.sourceforge.net/"
license=('GPL')
makedepends=('subversion')
depends=('bash' 'gnupg' 'libxml2' 'ncurses')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

_svnmod="${_pkgname}"
_svntrunk=https://pwman.svn.sourceforge.net/svnroot/${_pkgname}/trunk/

build() {
  cd "${srcdir}/"

  if [ -d "${_svnmod}" ]; then
    msg "Updating local SVN repository."
    (cd "${_svnmod}" && svn up)
    msg "SVN update done or server timeout."
  else
    msg "Checking out SVN repository."
    svn co "${_svntrunk}" "${_svnmod}"
    msg "SVN checkout done or server timeout."
  fi

  msg "Starting make process."

  rm -rf "${_svnmod}-build/"
  cp -r "${_svnmod}" "${_svnmod}-build/"
  cd "${_svnmod}-build/"

  ./bootstrap || return 1
  ./configure --prefix=/usr --mandir=/usr/share/man || return 1 
  make || return 1  
}

package()
{
  cd "${srcdir}/${_svnmod}-build"
  make DESTDIR=${pkgdir} install || return 1
}
