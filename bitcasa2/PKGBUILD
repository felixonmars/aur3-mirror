# Maintainer: Justin Hearn <justin@hearn.me>
# Contributor: Matt Harrison <matt@mistbyte.com>

pkgname=bitcasa2
pkgver=1.0.0.144
pkgrel=1
pkgdesc="Access Bitcasa cloud storage with a fused based filesystem (official client, beta)"
arch=('x86_64' 'i686')
url="https://bitcasa.com/personal/download-linux"
license=('custom')
depends=('gcc-libs' 'libidn' 'util-linux' 'fuse')
makedepends=('binutils' 'tar')
conflicts=('bitcasa')
install=.INSTALL
_source_arch="i386"
[ "$CARCH" = "x86_64" ] && _source_arch="amd64"
source=(
  "http://dist.bitcasa.com/release/apt/pool/main/b/bitcasa2/bitcasa2_${pkgver}_${_source_arch}.deb"
  "LICENSE"
  ".INSTALL"
)
sha256sums=(
  'a788717a73f2274d3a9f0db9d0acec5b3dc0ac42b501b81f35d15ea48c7a6cd7' # bitcasa2_1.0.0.144_i386.deb
  'fe41de4e03ae09031528a56dcae8395a0630fb56a813c94d96e700550fe102be' # LICENSE
  '7071d91530da23cbcaf1d302314fe7691ee8c41e5cf8a03b692c784194201a14' # .INSTALL
)
[ "$CARCH" = "x86_64" ] && sha256sums[0]='2f1ff6273c52c23c1dc7085179f9906f72c8049cf1d015201a68bce413a9ae13' # bitcasa2_1.0.0.144_amd64.deb

prepare() {
  cd $srcdir/
  msg "Unarchiving data from .deb package"
  tar xzf data.tar.gz
  msg2 "Done with .deb file"
}

package() {
  install -d "$pkgdir/usr/bin"

  msg "Installing files"
  # Install Mount binary
  install -Dm755 "$srcdir/sbin/mount.bitcasa" "$pkgdir/usr/bin/mount.bitcasa"

  # Install Share files
  install -d "$pkgdir/usr/share/locale/en/LC_MESSAGES"
  install -Dm644 "$srcdir/usr/share/locale/en/LC_MESSAGES/Bitcasa.mo" \
    "$pkgdir/usr/share/locale/en/LC_MESSAGES/Bitcasa.mo"
  install -d "$pkgdir/usr/share/man/en/man8"
  install -Dm644 "$srcdir/usr/share/man/en/man8/mount.bitcasa.8.gz" \
    "$pkgdir/usr/share/man/en/man8/mount.bitcasa.8.gz"

  # Install var files
  install -d "$pkgdir/var/lib/bitcasa/caches"
  install -Dm644 "$srcdir/var/lib/bitcasa/ca.pem" "$pkgdir/var/lib/bitcasa/ca.pem"
  install -Dm644 "$srcdir/var/lib/bitcasa/cache.conf" "$pkgdir/var/lib/bitcasa/cache.conf"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/bitcasa/LICENSE"
  msg2 "Done installing files"
}

# vim:set ts=2 sw=2 et:
