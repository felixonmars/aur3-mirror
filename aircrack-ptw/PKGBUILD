# Contributor: Alex Shearn <shearn89@hotmail.com>
pkgname=aircrack-ptw
pkgver=1.0.0
pkgrel=1
pkgdesc="The aircrack-ptw tool for faster WEP key retrieval. Use in conjunction with aircrack-ng suite."
arch=('i686')
url="http://www.cdc.informatik.tu-darmstadt.de/aircrack-ptw"
license=('GPL')
depends=('openssl' 'sqlite3' 'zlib' 'libpcap')
makedepends=()
source=($url/download/$pkgname-$pkgver.tar.gz
	aircrack-ptw.install)
install=aircrack-ptw.install
md5sums=('1d7d84d1e69189bc1397db3f565c183a'
         '4af5953c3e0656b209529fa63822fffc')
         
##############
build() {
  cd "$srcdir/$pkgname-$pkgver"

  make || return 1
  mkdir -p $startdir/pkg/usr/bin
  cp $pkgname $startdir/pkg/usr/bin/
}

# vim:set ts=2 sw=2 et:
