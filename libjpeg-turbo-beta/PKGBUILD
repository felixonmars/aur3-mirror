# Maintainer: Stefan Rebaud <rebaud_s@epita.fr>

pkgname=libjpeg-turbo-beta
pkgver=1.2.90
_pkgverfull="1.2.90 (1.3beta1)"
pkgrel=1
pkgdesc="libjpeg derivative with accelerated baseline JPEG compression and decompression (beta version)"
arch=('i686' 'x86_64')
url="http://libjpeg-turbo.virtualgl.org/"
license=('BSD')
depends=('glibc')
makedepends=('nasm')
provides=('libjpeg-turbo=1.2.90', 'libjpeg=8')
conflicts=('libjpeg-turbo')
options=('!libtool')
source=("http://sourceforge.net/projects/libjpeg-turbo/files/$_pkgverfull/libjpeg-turbo-$pkgver.tar.gz")
md5sums=('ea53fc1e8a00c26e2f501385f887f1f6')

build() {
  cd "$srcdir/libjpeg-turbo-$pkgver"

  ./configure --with-jpeg8 --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/libjpeg-turbo-$pkgver"

  make DESTDIR="$pkgdir/" install

  # Fix /usr/bin
  for fn in $pkgdir/usr/bin/*; do mv $fn ${fn}6; done
  # Fix /usr/lib
  rm $pkgdir/usr/lib/lib{turbo,}jpeg.{a,so}
  # Fix /usr/share/man
  for fn in $pkgdir/usr/share/man/man1/*; do mv $fn ${fn%.1}6.1; done
  # Fix /usr/include
  mkdir -p $pkgdir/usr/include/libjpeg6
  mv $pkgdir/usr/include/*.h $pkgdir/usr/include/libjpeg6
  mkdir -p $pkgdir/usr/share/doc/libjpeg6-turbo
  mv $pkgdir/usr/share/doc/{*.txt,README,*c} $pkgdir/usr/share/doc/libjpeg6-turbo
}
