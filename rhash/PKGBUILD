# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: 謝致邦 <Yeking@Red54.com>
# Contributor: cantabile <cantabile dot desu at gmail dot com>
# Contributor: reMiND <detanator@gmail.com>

pkgname=rhash
pkgver=1.3.3
pkgrel=1
pkgdesc='Utility for verifying hash sums (SFV, CRC, etc). Supports lots of algorithms.'
arch=('i686' 'x86_64')
url='http://rhash.anz.ru/?l=en'
license=('custom' 'MIT')
depends=('glibc')
backup=('etc/rhashrc')
#options=('staticlibs')
source=("http://downloads.sourceforge.net/rhash/rhash-$pkgver-src.tar.gz")
sha256sums=('5b520b597bd83f933d316fce1382bb90e0b0b87b559b8c9c9a197551c935315a')

build() {
  make -C rhash-$pkgver ADDCFLAGS="$CFLAGS" ADDLDFLAGS="$LDFLAGS" build-shared lib-static
}

check() {
  make -C rhash-$pkgver test-shared
}

package() {
  cd rhash-$pkgver

  # program
  make PREFIX=/usr DESTDIR="$pkgdir" install-shared
  # library
  make -C librhash PREFIX=/usr DESTDIR="$pkgdir" install-headers install-lib-shared install-lib-static
  # license
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/rhash/LICENSE
}
