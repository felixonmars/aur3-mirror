# Maintainer: BlackEagle <ike DOT devolder AT gmail DOT com>

pkgname=libnfs
pkgver=1.2.0
pkgrel=3
pkgdesc="client library for accessing NFS shares"
arch=('i686' 'x86_64')
url="https://github.com/sahlberg/libnfs"
license=('GPL')
depends=('glibc')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/sahlberg/libnfs/tarball/$pkgname-$pkgver"
	'001_fix_hanewin.patch'
)
_srcfolder=sahlberg-libnfs-d9a8346
sha256sums=(
	'dbe407c782cbd655fe5e7408bb10a38007c26c1a2f0d1761a5ebfacb6df5f6ca'
	'e77fab5fbcef3940fc038b9940f836aa4d8b9d82d3e3f6847790ae7bdc088de8'
)
options=(!libtool)

build() {
  mv "$_srcfolder" "$pkgname-$pkgver"

  cd "$pkgname-$pkgver"
  msg2 '001_fix_hanewin.patch'
  patch -Np0 -i "$srcdir/001_fix_hanewin.patch"

  autoreconf -vif
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
