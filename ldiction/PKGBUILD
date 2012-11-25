# Maintainer: George Kamenov <cybertorture@gmail.com>
pkgname=ldiction
pkgver=0.5.0
pkgrel=4
pkgdesc="LDiction is developed as free alternative to the most popular but payed (from several years) SA Dictionary."
arch=('i686' 'x86_64')
url="http://www.celyo.org/index.php/component/content/article/14-ldiction/15-ldiction-home"
license=('custom')
depends=()

if [[ $CARCH == i686 ]]; then
source=(http://www.celyo.org/files/$pkgname-$pkgver.tar.bz2)
md5sums=('66b19a19330ff591c126a766afd17d59')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib/ldiction
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/pixmaps
  cp ldiction $pkgdir/usr/lib/ldiction/
  ln -s /usr/lib/ldiction/ldiction $pkgdir/usr/bin/ldiction 
  cp en-bg.ldz $pkgdir/usr/lib/ldiction/
  cp bg-en.ldz $pkgdir/usr/lib/ldiction/
  cp ldiction.desktop $pkgdir/usr/share/applications/
  cp ldiction32.png $pkgdir/usr/share/pixmaps/ldiction.png
}

else
source=(http://www.celyo.org/files/$pkgname-$pkgver-25.1.x86_64.rpm)
md5sums=(e57047ec03e0f8dc0314971af5ff7b81)
build() {
  cd usr
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib/ldiction
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/pixmaps
  cp $srcdir/usr/bin/ldiction $pkgdir/usr/lib/ldiction/
  ln -s /usr/lib/ldiction/ldiction $pkgdir/usr/bin/ldiction 
  cp $srcdir/usr/lib64/ldiction/en-bg.ldz $pkgdir/usr/lib/ldiction/
  cp $srcdir/usr/lib64/ldiction/bg-en.ldz $pkgdir/usr/lib/ldiction/
  cp $srcdir/usr/share/applications/ldiction.desktop $pkgdir/usr/share/applications/
  cp $srcdir/usr/share/pixmaps/ldiction.png $pkgdir/usr/share/pixmaps/ldiction.png
}  
fi

