pkgname=bdns
pkgver=2.0.1
pkgrel=1
pkgdesc="bind/nsupdate web interface"
arch=(any)
url="http://bdns.sourceforge.net/"
license=('GPL')
depends=()
backup=()
options=()
source=("http://downloads.sourceforge.net/project/bdns/Bdns-$pkgver/Bdns-$pkgver/Bdns.tar.gz")
md5sums=('3cd21d166d89e4321e3ad2578d3c97a5')

build() {
  cd "$srcdir/"
  find ./Bdns -type d -name CVS -exec rm -rf {} \; || true
  mkdir -p $pkgdir/srv/http/
  cp -a Bdns $pkgdir/srv/http/Bdns
}
