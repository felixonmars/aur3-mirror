pkgname=psi-otrplugin-tfh-berlin
pkgver=0.5
pkgrel=2
pkgdesc="Plugin for PSI which allows OTR-encryption"
arch=('i686' 'x86_64')
url="http://public.tfh-berlin.de/~s30935//"
license=('GPL2')
depends=('qt' 'libotr=3.2.0' 'psi-otr-tfh-berlin=0.14')
source=("http://public.tfh-berlin.de/~s30935/files/psi-otr-$pkgver.tar.gz")
md5sums=('134c1c21e9e1bcb1e2a2e159bf895359')

build() {
  cd "$srcdir/psi-otr-$pkgver"
  qmake PREFIX=/usr || return 1
  make || return 1
  make INSTALL_ROOT="$pkgdir" install || return 1
  mkdir -p "$pkgdir/usr/share/psi/"
  mv  "$pkgdir/usr/local/share/psi/plugins/" "$pkgdir/usr/share/psi/"
  rm -r "$pkgdir/usr/local/"
}
