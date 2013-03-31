# Maintainer: TDY <tdy@archlinux.info>

pkgname=python2-webiopi
pkgver=0.6.0
pkgrel=1
pkgdesc="A Raspberry Pi REST framework to control the GPIO and more"
arch=('armv6h')
url="http://code.google.com/p/webiopi/"
license=('APACHE')
depends=('python2')
makedepends=('python2-distribute')
conflicts=('python-webiopi')
install=webiopi.install
source=(http://webiopi.googlecode.com/files/WebIOPi-$pkgver.tar.gz
        webiopi.service)
sha256sums=('df3f64e7355a76cbd5eb7a6095a2a726194b74fd94fef6b92d6b1593f1445e1f'
            '14fefdffaec288d3fcfb1ed62ac47cb40d89e1cfe1dff5043b575ae684c2dd77')

build() {
  cd "$srcdir/WebIOPi-$pkgver/python"
  python2 setup.py build
  find ! -executable -exec sed -i '1s/python/&2/' '{}' \;
}

package() {
  cd "$srcdir/WebIOPi-$pkgver/python"
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm755 ${pkgname#*-}.sh "$pkgdir/usr/bin/${pkgname#*-}"
  sed -i 's/python/&2/' "$pkgdir/usr/bin/${pkgname#*-}"

  # passwd
  install -Dm755 ${pkgname#*-}-passwd.py "$pkgdir/usr/bin/${pkgname#*-}-passwd"
  install -Dm644 passwd "$pkgdir/etc/${pkgname#*-}/passwd"

  # resources
  install -dm755 "$pkgdir/usr/share/${pkgname#*-}"
  cp -a ../htdocs "$pkgdir/usr/share/${pkgname#*-}"

  # service
  install -Dm644 "$srcdir/${pkgname#*-}.service" \
      "$pkgdir/usr/lib/systemd/system/${pkgname#*-}.service"

  # fix module import
  _V="$(python2 -V |& awk '{print $2}' | sed 's/\.[0-9]*$//')"
  touch "$pkgdir/usr/lib/python$_V/site-packages/_webiopi/__init__.py"
}

# vim:set ts=2 sw=2 et:
