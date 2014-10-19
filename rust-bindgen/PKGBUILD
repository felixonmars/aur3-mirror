# Maintainer: Félix Saparelli <aur@passcod.name>
# Repo: https://github.com/passcod/pkgs/tree/master/rust-bindgen
pkgname=rust-bindgen
pkgver=0.12
pkgrel=2
pkgdesc="Binding generator for rust language"
arch=('i686' 'x86_64')
url="https://github.com/crabtw/rust-bindgen"
license=('BSD')
makedepends=('rust')
source=("https://github.com/crabtw/rust-bindgen/archive/${pkgver}.tar.gz")
sha512sums=('f3b82b2a926e3d7b278fa34a515d4f883f5aab3dadf07ce06f099a38755f46f09ea0ac67fb026ab7837266fc5a758064ad2f0659518dedd0221c19e17377a5f2')
package() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build
  lib=$(cd target; ls libbindgen*.so)
  install -D target/bindgen "$pkgdir/usr/bin/bindgen"
  install -D target/$lib "$pkgdir/usr/lib/$lib"
}
