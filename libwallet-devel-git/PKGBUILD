# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libwallet-devel-git
pkgver=20140526
pkgrel=1
pkgdesc="Bitcoin client side library for wallet functionality such as working with addresses, deterministic wallets and different key formats (development branch)"
arch=('i686' 'x86_64')
depends=('boost-libs' 'libbitcoin-leveldb-devel-git')
makedepends=('gcc' 'git' 'make' 'pkg-config')
url="https://github.com/libbitcoin/libwallet"
license=('AGPL3')
source=(git+https://github.com/libbitcoin/libwallet#branch=develop)
sha256sums=('SKIP')
provides=('libwallet')
conflicts=('libwallet')

pkgver() {
  cd ${pkgname%-devel*}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-devel*}

  msg 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/libwallet \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/libwallet \
    --localstatedir=/var/lib/libwallet \
    --with-gnu-ld
  make
}

package() {
  cd ${pkgname%-devel*}

  msg 'Installing license...'
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/libwallet/LICENSE"

  msg 'Installing...'
  make DESTDIR="$pkgdir" install

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
