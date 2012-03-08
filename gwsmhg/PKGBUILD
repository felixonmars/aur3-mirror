# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=gwsmhg
pkgver=0.13.1
pkgrel=1
pkgdesc="A PyGTK GUI for work space management using Mercurial (hg) and mq"
arch=(any)
url="http://gwsmhg.sourceforge.net/"
license=('GPL')
depends=('pygtksourceview2' 'mercurial' 'desktop-file-utils')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/gwsmhg/gwsmhg/v-0.13/$pkgname-$pkgver.tar.gz")
md5sums=('88b89d2f6006dfa39cfc9c47eef30caf')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/"

  # desktop file
  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
