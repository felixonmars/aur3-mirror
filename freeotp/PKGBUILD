pkgname=freeotp
pkgver=0.2
pkgrel=1
epoch=
pkgdesc="One-time Pad Encryption"
arch=(i686 x86_64)
url="http://16s.us/FreeOTP/"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://16s.us/FreeOTP/downloads/FreeOTP-$pkgver-Source.tar.gz)
noextract=()
sha256sums=('2ee0e702e24bcbc1bce328c14099637b556b54f32c67da43060a346209059892')


build() {
	cd "$srcdir"
  g++ -o FreeOTP ./otp.cpp
}

package() {
	cd "$srcdir"
  install -d $pkgdir/usr/bin
  install -m 755 ./FreeOTP $pkgdir/usr/bin
}
