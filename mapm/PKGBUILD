# Maintainer: Jan Dlabal <dlabaljan at gmail dot com>
# Contributor: Fabio Comolli <fabio.comolli@gmail.com>
pkgname=mapm
pkgver=4.9.5a
pkgrel=1
pkgdesc="Mike's Arbitrary Precision Math Library"
arch=('i686' 'x86_64')
url="http://www.tc.umn.edu/~ringx004/mapm-main.html"
license=('custom')
depends=('glibc')
source=("http://www.tc.umn.edu/~ringx004/mapm-$pkgver.tar.gz" "mapm_license.txt")
md5sums=('02a31f0711d9a52fd75a06dc8b91e5ca' 'da3cb95d8f0e9a3ce12de8a8c702ecc7')

build() {
  cd $srcdir/mapm_$pkgver
  gcc -c -Wall -O2 -fPIC map*.c || return 1
  gcc -shared -o libmapm.so.0 map*.o || return 1
  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/include
  mkdir -p $pkgdir/usr/share/mapm
  cp $srcdir/mapm_$pkgver/libmapm.so.0 $pkgdir/usr/lib
  cp $srcdir/mapm_$pkgver/m_apm*.h $pkgdir/usr/include
  cp -a $srcdir/mapm_$pkgver/DOCS $pkgdir/usr/share/mapm
  install -D -m644 ../../mapm_license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE || return 1
}
