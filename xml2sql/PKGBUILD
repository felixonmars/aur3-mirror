# Contributor: Andreas W. Hauser <andy-aur@splashground.de>
pkgname=xml2sql
pkgver=0.5
pkgrel=1
pkgdesc="a tool to convert wikimedia xml dumps to SQL"
url="http://meta.wikimedia.org/wiki/Xml2sql"
license="BSD/GPL"
arch=(x86_64 i686)
source=("ftp://ftp.tietew.jp/pub/wikipedia/$pkgname-$pkgver.tar.gz")

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
md5sums=('8a1d905636900e3ea07055dd645276f8')
