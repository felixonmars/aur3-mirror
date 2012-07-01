# Maintainer: Lukas Martini <hello@lutoma.org>
pkgname=mlmmj-web
pkgver=0.2.0
pkgrel=1
pkgdesc="mlmmj-web is a web archiver for mlmmj-based mailing lists"
url="https://github.com/lutoma/mlmmj-web"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('python' 'python-jinja')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=''

source=("https://github.com/lutoma/mlmmj-web/tarball/v${pkgver}")
md5sums=('41068cb01c52a850e655495bf5327670')

package() {
  cd ${srcdir}/*-${pkgname}-*
  #install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm755 mlmmj-web.py "$pkgdir/usr/bin/mlmmj-web"
  install -dm755 "$pkgdir/usr/share/$pkgname/templates/"
  install -Dm644 templates/* "$pkgdir/usr/share/$pkgname/templates/"
}
