pkgname=tc-play
pkgver=0.11
pkgrel=1
pkgdesc="Free and simple TrueCrypt implementation based on dm-crypt."
arch=('i686' 'x86_64')
url="https://github.com/bwalex/tc-play"
license=('custom')
depends=('cryptsetup' 'libgcrypt' 'openssl')
source=("https://github.com/downloads/bwalex/tc-play/$pkgname-$pkgver.tar.bz2")
md5sums=('a30d7bd72ddbc31246bec55250bad68f')
sha512sums=('3beff5c06a256d93a1c731cf1c980f999f970973bd37e395b67d115d87b26280bd57a445c42caccb3b86a7b02bcf85cef5c6c3475b9bead2cb7caba576c2d57d')



build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 tcplay "$pkgdir"/usr/bin/tcplay
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/tc-play/LICENSE
}