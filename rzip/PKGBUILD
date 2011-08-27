# Contributor: Douglas Thrift <douglas@douglasthrift.net>
pkgname=rzip
pkgver=2.1
pkgrel=2
pkgdesc="compression program similar to gzip or bzip2"
url="http://rzip.samba.org/"
depends=('bzip2')
source=(http://rzip.samba.org/ftp/rzip/$pkgname-$pkgver.tar.gz Makefile.in.patch)
md5sums=('0a3ba55085661647c12f2b014c51c406' '4e88c5393e1e1c064878087016952c40')

build()
{
  cd $startdir/src/$pkgname-$pkgver
  patch -p1 < $startdir/src/Makefile.in.patch
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}
