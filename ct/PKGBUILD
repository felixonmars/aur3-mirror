# Contributor: Daniel Ehlers <danielehlers@mindeye.net>
pkgname=ct
pkgver=0.4
license=GPL2
pkgrel=1
pkgdesc="Commit Tool or (h)gct is a GUI enabled commit tool for Git and Mercurial (hg)."
url="http://www.cyd.liu.se/~freku045/gct/"
depends=('pyqt' 'python')
source=(http://www.cyd.liu.se/~freku045/gct/$pkgname-$pkgver.tar.gz)
md5sums=('a3542fddf5f4ffb1d7b37439c88c815f')

build () {
  cd $startdir/src/$pkgname-$pkgver
  make
  install -d $startdir/pkg/usr/bin
  make PREFIX=$startdir/pkg/usr install
}
