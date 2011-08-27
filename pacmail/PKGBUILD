# Contributor: Tad Fisher <tadfisher at gmail dot com>
pkgname=pacmail
pkgver=0.1.5
pkgrel=1
pkgdesc="An email notification daemon for Arch Linux (pacman) updates"
arch=(any)
url="http://code.google.com/p/pacmail/"
license=('GPL')
depends=('python' 'pacman')
makedepends=()
backup=('etc/pacmail.conf')
install=pacmail.install
source=(http://pacmail.googlecode.com/files/$pkgname-$pkgver.tar.gz \
	$pkgname)

build() {
  cd $startdir/src/$pkgname-$pkgver
  python setup.py build || return 1
  python setup.py install --root=$startdir/pkg || return 1

  install -D -m755 $srcdir/pacmail $pkgdir/etc/rc.d/pacmail
}
