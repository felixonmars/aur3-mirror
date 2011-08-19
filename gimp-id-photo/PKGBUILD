# Contributor: OvsInc <ovsinc(at)ya(dot)ru>

pkgname=gimp-id-photo
pkgver=20110811beta
pkgrel=2
pkgdesc="A Gimp plugin for simply create stuff photo"
url="http://gimp-id-photo.ru/"
arch=('any')
license=("GPL")
depends=('gimp' 'python2')
makedepends=('pkgconfig')
source=('http://gimp-id-photo.ru/files/id-photo-BETA-11-august-2011.zip' 'arch-python2.diff')

build() {
  cd $srcdir
  patch -p0 < arch-python2.diff || return 1
  install -d "$pkgdir"/usr/lib/gimp/2.0/plug-ins/
  install -d "$pkgdir"/usr/share/{licenses,doc}/$pkgname-$pkgver-$pkgrel
  install -m 755 "$srcdir"/id_photo_BETA.py  "$pkgdir"/usr/lib/gimp/2.0/plug-ins/ || return 1
  install -m 644 "$srcdir"/formats.conf  "$pkgdir"/usr/lib/gimp/2.0/plug-ins/ || return 1
  install -m 644 "$srcdir"/LICENSE.txt  "$pkgdir"/usr/share/licenses/$pkgname-$pkgver-$pkgrel/ || return 1
  install -m 644 "$srcdir"/ReadMe.txt  "$pkgdir"/usr/share/doc/$pkgname-$pkgver-$pkgrel/ || return 1
}

md5sums=('8686b8a04e67cef88de257fb8196364a'
         '107b0013a6d345345632a18abe7f1a09')
