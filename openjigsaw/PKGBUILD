# Maintainer: Heiko Baums <heiko@baums-on-web.de>

pkgname=openjigsaw
pkgver=0.6
pkgrel=1
pkgdesc="A jigsaw puzzle"
arch=('i686' 'x86_64')
url="http://marijnhaverbeke.nl/jigsaw/"
license=('custom')
depends=('wxgtk')
source=(http://marijnhaverbeke.nl/jigsaw/$pkgname-$pkgver-source.zip
        $pkgname.patch
	$pkgname.desktop)
md5sums=('e213703a0a4b91a0d28d58fe9742e99b'
         '4b1089de2bc38c241fe908efd3848fbb'
         '8b4451d3729ff593335aea4a961cffd8')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -Np0 -i $srcdir/$pkgname.patch
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m 755 $srcdir/$pkgname-$pkgver/jigsaw $pkgdir/usr/bin/jigsaw
  install -d $pkgdir/usr/share/pixmaps
  install -D -m 644 $srcdir/$pkgname-$pkgver/pixmaps/* $pkgdir/usr/share/pixmaps
  install -D -m 644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D -m 644 $srcdir/$pkgname-$pkgver/COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
