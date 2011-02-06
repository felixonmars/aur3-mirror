# Maintainer: Can Celasun <dcelasun[at]gmail[dot]com>
pkgname=dmake-svn
pkgver=277090
pkgrel=1
pkgdesc='A make utility similar to GNU make (latest svn revision)'

arch=('i686' 'x86_64')
url='http://tools.openoffice.org/dmake/index.html'
license=('custom')
provides=('dmake')
makedepends=('make' 'subversion')

_svntrunk=svn://svn.services.openoffice.org/ooo/trunk/dmake
_svnmod=dmake

build() {
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  
  cd $srcdir/$_svnmod
  ./configure
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
