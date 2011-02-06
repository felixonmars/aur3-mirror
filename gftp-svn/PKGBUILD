# Contributor:  Timothy Hoffmeyer <tim.hoffmeyer [at] archlinux [dot] us>

pkgname=gftp-svn
pkgver=995
pkgrel=2
pkgdesc="gFTP is a free multithreaded file transfer client for *NIX based machines."
url="http://www.gftp.org"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('gtk' 'openssl' 'readline')
makedepends=('subversion')
conflicts=('gftp')
provides=('gftp')

source=()
md5sums=()

_svntrunk=http://svn.gnome.org/svn/gftp/trunk
_svnmod=gftp

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./autogen.sh --prefix=/usr --mandir=/usr/share/man

  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  rm -rf ${srcdir}/$_svnmod-build
}
