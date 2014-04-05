# Maintainer: TDY <tdy@archlinux.info>

pkgname=python-webiopi
pkgver=0.7.0
pkgrel=1
pkgdesc="A Raspberry Pi REST framework to control the GPIO and more"
arch=('armv6h')
url="http://code.google.com/p/webiopi/"
license=('APACHE')
depends=('python')
makedepends=('python-distribute')
install=webiopi.install
source=(http://downloads.sourceforge.net/project/webiopi/WebIOPi-$pkgver.tar.gz
        webiopi.service)
sha256sums=('b55e39da14dc328b2ac7ed600acbca4ef1fe58a05ae59efc27bbe117b65afea3'
            '620c03fb8a190d3b395dd512084f1cfb99538f89cfe05a24fd9180a855529d73')

build() {
  cd "$srcdir/WebIOPi-$pkgver/python"
  python3 setup.py build
}

package() {
  cd "$srcdir/WebIOPi-$pkgver/python"
  python3 setup.py install --root="$pkgdir" --optimize=1
  install -Dm755 ${pkgname#*-}.sh "$pkgdir/usr/bin/${pkgname#*-}"
  sed -i 's/python/&3/' "$pkgdir/usr/bin/${pkgname#*-}"

  # passwd
  install -Dm755 ${pkgname#*-}-passwd.py "$pkgdir/usr/bin/${pkgname#*-}-passwd"
  install -Dm644 passwd "$pkgdir/etc/${pkgname#*-}/passwd"

  # resources
  install -dm755 "$pkgdir/usr/share/${pkgname#*-}"
  cp -a ../htdocs "$pkgdir/usr/share/${pkgname#*-}"

  # service
  install -Dm644 "$srcdir/${pkgname#*-}.service" \
      "$pkgdir/usr/lib/systemd/system/${pkgname#*-}.service"
}

# vim:set ts=2 sw=2 et:
