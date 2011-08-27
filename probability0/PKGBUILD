# Maintainer: Hubert Maraszek <marach5 at gmail dot com>
pkgname=probability0
pkgver=1.05
pkgrel=4
pkgdesc="A challenging freeware survival platformer."
arch=('any')
url="http://forums.tigsource.com/index.php?topic=9224.0"
license=('CCPL:by-nd')
depends=('python2' 'pyglet' 'python-audiere' 'python2-numpy' 'alsa-oss')
source=(http://dl.dropbox.com/u/27951479/probability0-1.05.tar.gz
        probability0
        probability0.desktop)
md5sums=('222ff4ae32ad22956834a92e2fca2ab5'
         '1115d15ad74c1eb1b0c1b36a5dda902f'
         '212d41902f3e1a8caf898c93c2d6c422')

package() {
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r ""$srcdir/$pkgname-$pkgver/*"" "$pkgdir/usr/share/$pkgname"
  chmod -R 755 "$pkgdir/usr/share/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  cp probability0 "$pkgdir/usr/bin"
  chmod 755 "$pkgdir/usr/bin/probability0"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  cp "$srcdir/$pkgname-$pkgver/data/img/pzeroicon32.png" "$pkgdir/usr/share/pixmaps/probability0.png"
  mkdir -p "$pkgdir/usr/share/applications"
  cp probability0.desktop "$pkgdir/usr/share/applications"
}

# vim:set ts=2 sw=2 et:
