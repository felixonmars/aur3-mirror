# Contributor: Elia Notarangelo <elia.notarangelo@gmail.com>

pkgname=witalian
pkgver=1.7.5
pkgrel=1
pkgdesc="Contains an alphabetic list of Italian words."
arch=('any')
url="http://packages.debian.org/sid/witalian"
license=('GPL')
source=(ftp://62.44.96.11/debian/pool/main/w/witalian/witalian_1.7.5.tar.gz)
md5sums=('ea17b634c6225bcddbdbd41856ff012b')

build() {
  cd $srcdir/$pkgname
  make prefix=$pkgdir/usr mandir=$pkgdir/usr/share/man install
}
