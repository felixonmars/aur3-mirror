# Maintainer: Ștefănescu Cristian <howerkraft@gmail.com>
# Old Maintainer: György Balló <ballogy@freestart.hu>
pkgname=gm-notify
pkgver=0.10.3
pkgrel=2
pkgdesc="A simple GMail Notifier which takes advantages of the new and nice notify-osd and indicator-applet"
arch=('any')
url="https://launchpad.net/gm-notify"
license=('GPL')
depends=('gstreamer0.10-python' 'python2-gconf' 'python2-gnomekeyring' 'python2-notify' 'libindicate-gtk2' 'twisted')
install=$pkgname.install
source=(http://launchpad.net/$pkgname/0.x/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('ae012995b75dd63599fcb2cd7356267a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' gtalk.py

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root=$pkgdir/ --optimize=1

  mv "$pkgdir/etc/gconf" "$pkgdir/usr/share"
  rm -r "$pkgdir/etc"
}
