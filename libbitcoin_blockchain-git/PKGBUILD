# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libbitcoin_blockchain-git
pkgver=20140628
pkgrel=1
pkgdesc="Blockchain component for libbitcoin"
arch=('i686' 'x86_64')
depends=('libbitcoin-leveldb-devel-git')
makedepends=('gcc' 'git' 'libtool' 'pkg-config')
url="https://github.com/libbitcoin/libbitcoin_blockchain"
license=('AGPL3')
source=(${pkgname%-git}::git+https://github.com/libbitcoin/libbitcoin_blockchain)
sha256sums=('SKIP')
provides=('libbitcoin_blockchain')
conflicts=('libbitcoin_blockchain')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/libbitcoin_blockchain \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/libbitcoin_blockchain \
    --localstatedir=/var/lib/libbitcoin_blockchain \
    --with-gnu-ld
  make
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/libbitcoin_blockchain/COPYING

  msg 'Installing...'
  make DESTDIR="$pkgdir" install

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
