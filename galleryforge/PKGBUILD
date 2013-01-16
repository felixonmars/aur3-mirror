# Maintainer: TDY <tdy@archlinux.info>

pkgname=galleryforge
pkgver=1.1.5
pkgrel=2
pkgdesc="A utility for generating and maintaining a personal photo album gallery"
arch=('any')
url="http://galleryforge.berlios.de/"
license=('GPL')
depends=('python2-imaging>=1.1.4' 'wxpython>=2.6.0')
install=$pkgname.install
source=(http://download.berlios.de/$pkgname/$pkgname-$pkgver.tar.gz
        $pkgname.desktop)
md5sums=('3001ba572354469ad2239e20827b8c0b'
         '8cfec5344d1fa09886ca4b018b9d6f63')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  find -name '*.py' -exec sed -i '1s/python/&2/' '{}' \;
  python2 install.py "$pkgdir"
  install -Dm644 doc/README "$pkgdir/usr/share/doc/$pkgname/README"

  # bins
  install -dm755 "$pkgdir/usr/bin"
  ln -sf /opt/$pkgname/bin/$pkgname.py "$pkgdir/usr/bin/$pkgname"
  ln -sf /opt/$pkgname/bin/$pkgname-gui.py "$pkgdir/usr/bin/$pkgname-gui"

  # desktop entries
  install -Dm644 $pkgname/gui/${pkgname}_logo.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  rm -rf "$pkgdir/opt"/{bin,$pkgname/doc}
}

# vim:set ts=2 sw=2 et:
