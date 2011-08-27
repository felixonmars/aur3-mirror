# Maintainer: Polslinux <admin@polslinux.it>
pkgname=dar-newest
_pkgreal=dar
pkgver=2.4.1
pkgrel=1
pkgdesc='A full featured command-line backup tool, short for Disk ARchive'
arch=('i686' 'x86_64')
url='http://dar.linux.free.fr/'
license=('GPL')
depends=('bzip2' 'lzo2' 'libgcrypt')
optdepends=('perl: for running some samples')
source=("http://downloads.sourceforge.net/sourceforge/${_pkgreal}/${_pkgreal}-$pkgver.tar.gz")
provides=("dar=2.4.1")
md5sums=('727e0b266d761e4dfd48a6af759413cb')
options=('!libtool')

build() {
  cd "$srcdir/${_pkgreal}-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc 
  make 
}
package() {
  cd "$srcdir/${_pkgreal}-$pkgver"
  install -d $pkgdir/usr/share/doc/${_pkgreal}
  make DESTDIR="$pkgdir" install 
  cd $pkgdir/usr/share/${_pkgreal}
  mv *.html  $pkgdir/usr/share/doc/${_pkgreal}
  rm -r man
  for _i in html mini-howto samples 
  do
    mv ${_i} $pkgdir/usr/share/doc/${_pkgreal}
  done
}
