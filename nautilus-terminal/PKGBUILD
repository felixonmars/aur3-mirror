# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=nautilus-terminal
pkgver=1.0
pkgrel=1
pkgdesc="An integrated terminal for Nautilus"
arch=(any)
url="http://projects.flogisoft.com/nautilus-terminal/"
license=(GPL)
depends=(python-nautilus vte3 pyxdg)
source=(http://projects.flogisoft.com/$pkgname/download/${pkgname}_${pkgver}_src.tar.gz)
md5sums=(ba89ae9a4e5c632a03da7e342679ad94)

build() {
  cd "$srcdir/${pkgname}_${pkgver}_src"

  sed -i 's|^#!/usr/bin/python$|#!/usr/bin/python2|' src/nautilus_terminal.py
}

package() {
  cd "$srcdir/${pkgname}_${pkgver}_src"

  ./install.sh --package "$pkgdir"

  # Remove doc files
  rm -r $pkgdir/usr/share/doc
}
