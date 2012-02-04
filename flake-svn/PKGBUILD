# Contributor:  Dmitry A. Ilyashevich <dmitry.ilyashevich@gmail.com>
pkgname=flake-svn
pkgver=114
pkgrel=1
pkgdesc="Flake is an open-source FLAC audio encoder"
url="http://flake-enc.sourceforge.net/"

depends=('glibc')
makedepends=('subversion')
conflicts=('flake')
provides=('flake')

source=()
md5sums=()

_svntrunk=https://flake-enc.svn.sourceforge.net/svnroot/flake-enc
_svnmod=flake-enc

build() {
  cd $startdir/src

  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  cd $_svnmod

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  ./configure --prefix=/usr 
  make || return 1
  make DESTDIR=$startdir/pkg/ install
}
# vim:syntax=sh

