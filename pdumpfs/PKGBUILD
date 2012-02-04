# Contributor: Andreas Hauser <andy-aur@splashground.de>

pkgname=pdumpfs
pkgver=1.3
pkgrel=1
pkgdesc="a daily backup system similar to Plan9's dumpfs"
arch=(i686 x86_64)
depends=('ruby')
url="http://0xcc.net/pdumpfs/index.html.en"
source=(http://0xcc.net/pdumpfs/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  mkdir -p $startdir/pkg/usr/bin
  install pdumpfs $startdir/pkg/usr/bin
}

md5sums=('c1bb6514b3136854ca265913fd3765c9')
