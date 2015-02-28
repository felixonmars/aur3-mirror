# Maintainer: Peter Marheine <peter@taricorp.net>
pkgname=cargo-git
pkgver=0.0.1.pre.298.g5773064
pkgrel=1
pkgdesc="Downloads dependencies for and compiles Rust projects."
arch=('i686' 'x86_64')
url="http://crates.io/"
license=('MIT' 'Apache')
groups=()
epoch=1
depends=('git' 'rust' 'curl' 'openssl')
makedepends=('cmake' 'python' 'git')
provides=('cargo')
conflicts=('cargo')
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/rust-lang/cargo.git'
        'git+https://github.com/rust-lang/rust-installer.git')
noextract=()
md5sums=('SKIP' 'SKIP')
_pkgname=cargo

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags | sed -e 's/^v//;y/-/./'
}

prepare() {
  cd "$srcdir/cargo"
  git submodule init
  git config submodule.src/rust-installer.url "$srcdir/rust-installer"
  git submodule update
}

build() {
  cd "$srcdir/cargo"
  ./configure --prefix=/usr --disable-verify-install
  make
}

package() {
  cd "$srcdir/cargo"
  make DESTDIR="$pkgdir/" install
  rm "$pkgdir"/usr/lib/rustlib/{components,manifest-cargo,rust-installer-version,install.log,uninstall.sh}
  mv "$pkgdir/usr/etc" "$pkgdir"
  install -D -m 644 "$srcdir/cargo/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}

# vim:set ts=2 sw=2 et:
