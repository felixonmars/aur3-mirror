# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=exif-py
pkgver=1.2.0
pkgrel=1
pkgdesc="Python library to extract EXIF data from tiff and jpeg files."
arch=('any')
url="http://sourceforge.net/projects/exif-py/"
license=('custom:BSD')
depends=('python2')
source=("https://github.com/ianare/exif-py/archive/$pkgver.tar.gz")
md5sums=('a3f51e251453e3e17b766dc33e528023')

prepare() {
  sed -i '1s/python/&2/' "$srcdir/$pkgname-$pkgver/EXIF.py"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # lib
  install -Dm755 EXIF.py "$pkgdir/usr/lib/python2.7/site-packages/EXIF.py"

  # bin
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/python2.7/site-packages/EXIF.py "$pkgdir/usr/bin/exif-py"

  # docs
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 README.md changes.txt "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  sed -n '51,80p' EXIF.py > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
