# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=downpour-svn
pkgver=1019
pkgrel=1
pkgdesc="Web-based BitTorrent client supporting auto-downloading from RSS and importing and renaming into a media library."
url="http://jongsma.org/software/downpour/"
depends=('libtorrent' 'python-dateutil' 'python-jinja' 'python2-feedparser' 'sqlite3' 'storm' 'twisted')
makedepends=('python2-distribute')
options=(!emptydirs)
conflicts=('downpour')
arch=('i686' 'x86_64')
license=('GPL')
install=downpour.install

_svntrunk=http://jongsma.org/svn/downpour/trunk 
_svnmod=downpour

build() {
  cd $startdir/src

  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $srcdir/downpour

  python2 setup.py install --root=$pkgdir --optimize=1
  install -Dm644 cfg/downpour.cfg $pkgdir/etc/downpour.cfg
}