# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Dave Reisner <d@falconindy.com>
# Contributor: William Giokas (KaiSforza) <1007380@gmail.com>

pkgname=libbitcoin-leveldb-git
pkgver=20140525
pkgrel=1
pkgdesc="libbitcoin asynchronous C++ library for Bitcoin, with leveldb enabled"
arch=('i686' 'x86_64')
depends=('boost' 'curl' 'leveldb' 'openssl' 'secp256k1-git')
makedepends=('gcc' 'git' 'libtool' 'pkg-config')
url="https://github.com/libbitcoin/libbitcoin"
license=('AGPL3')
source=(git+https://github.com/libbitcoin/libbitcoin)
sha256sums=('SKIP')
provides=('libbitcoin')
conflicts=('libbitcoin')

pkgver() {
  cd ${pkgname%-leveldb*}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-leveldb*}

  msg 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/libbitcoin \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/libbitcoin \
    --localstatedir=/var/lib/libbitcoin \
    --with-libsecp256k1 \
    --with-gnu-ld \
    --enable-leveldb
  make
}

package() {
  cd ${pkgname%-leveldb*}

  msg 'Installing license...'
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/libbitcoin/LICENSE

  msg 'Installing...'
  make DESTDIR="$pkgdir" install

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
