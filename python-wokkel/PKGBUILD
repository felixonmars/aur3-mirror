# Contributor: Maurizio Porrato <maurizio.porrato@gmail.com>
pkgname=python-wokkel
pkgver=0.6.3
pkgrel=4
pkgdesc="Twisted Jabber support library"
license=('custom:"Wokkel License"')
url="http://wokkel.ik.nu/"
source=("http://wokkel.ik.nu/releases/$pkgver/wokkel-$pkgver.tar.gz")
md5sums=('bfc6570c19602393b43ec25c69ec7727') 
arch=(any)
makedepends=('python2-distribute')
depends=('twisted')

build() {
  cd $srcdir/wokkel-$pkgver
  python2 setup.py install --prefix=/usr --root=$startdir/pkg --optimize=1
  install -Dm 644 $srcdir/wokkel-$pkgver/LICENSE $pkgdir/usr/share/licenses/python-wokkel/license
}
