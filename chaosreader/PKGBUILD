# Contributor: quaker4lyf <quaker4lyf(at)yahoo(dot)com>
pkgname=chaosreader
pkgver=0.94
pkgrel=1
pkgdesc="Fetch application data from snoop or tcpdump logs"
arch=("i686" "x86_64")
url="http://www.brendangregg.com/chaosreader.html"
license=('GPL')
depends=(perl)
makedepends=()
filename="$pkgname$pkgver"
source=("http://softlayer.dl.sourceforge.net/sourceforge/chaosreader/$filename")
noextract=($filename)
md5sums=("ef307a4aa11964dc2558248847219ae9")

build() {
  cd $srcdir
  install -m755 -D $filename $pkgdir/usr/bin/$pkgname
}
