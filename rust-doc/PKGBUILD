# Maintainer: James Zhu <james.zhu.engineer@gmail.com>
pkgname=rust-doc
pkgver=1.0.0
pkgrel=1
pkgdesc="Rust language and API documentation (stable channel)"
arch=('i686' 'x86_64')
url="http://www.rust-lang.org/"
license=('MIT' 'Apache')
conflicts=('rust-doc-git')
provides=('rust-doc')
source_x86_64=("https://static.rust-lang.org/dist/rust-docs-$pkgver-x86_64-unknown-linux-gnu.tar.gz"{,.asc})
source_i686=("https://static.rust-lang.org/dist/rust-docs-$pkgver-i686-unknown-linux-gnu.tar.gz"{,.asc})
sha256sums_x86_64=('08d27f9418d66557a3bbeba30654a2e41211015ca247e348b3a92e3a322b667e'
                   '9d8be221c9f47aa1706bd8e9db35448500aaf604888e22651995046644b29895')
sha256sums_i686=('0f7eea82ef5b657bdea2f008c65cc8a7e97eaf7a781ca939d5075bd0403e0433'
                 '375a3fcf37c4b05d659ecce6d2f67db7ac894d524ab1726d4740daef32a0b73c')
optdepends=('rust: language compiler')
options=('docs' '!strip')
validpgpkeys=('108F66205EAEB0AAA8DD5E1C85AB96E6FA1BE5FE') # Rust Language (Tag and Release Signing Key) <rust-...@rust-lang.org>
#gpg --keyserver hkp://keys.gnupg.net --recv-keys 108F66205EAEB0AAA8DD5E1C85AB96E6FA1BE5FE

package() {
    cd $srcdir/rust-docs-$pkgver-$CARCH-unknown-linux-gnu
    ./install.sh --prefix=$pkgdir/usr --disable-ldconfig

    rm -rf "$pkgdir/usr/lib/"
}
