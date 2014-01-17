# Maintainer: Jeff Bigler <jbigler at saturnstudio dot com> 
pkgname=trelby
pkgver=2.2
pkgrel=3
pkgdesc="A free, multiplatform, feature-rich screenwriting program"
arch=("any")
url="http://www.trelby.org"
license=('GPL')
depends=('wxpython2.8' 'python2-lxml')
optdepends=('ttf-courier-screenplay: a better courier font for screenplays')
source=(http://www.trelby.org/files/release/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('86579f0c19f1070a068c8fbcc4d4f541')

package() {
  sed -i 's/env python/env python2'/ $srcdir/$pkgname-$pkgver/trelby/src/trelby.py
  sed -i "/^from error .*/a import wxversion\nwxversion.select('2.8')" \
    $srcdir/$pkgname-$pkgver/trelby/src/trelby.py
  sed -i '/^Categories/c Categories=Office;Publishing' \
    $srcdir/$pkgname-$pkgver/trelby/trelby.desktop
  mkdir -p "$pkgdir/opt"
  cp -r "$srcdir/$pkgname-$pkgver/trelby" "$pkgdir/opt"
  install -Dm755 "$srcdir/$pkgname-$pkgver/trelby/trelby.desktop" \
    "$pkgdir/usr/share/applications/trelby.desktop"
}
