# Maintainer: Davide "FunkyAss" Del Zompo <davide  dot  delzompo at gmail.com>
pkgname=luatodo-git
pkgver=r19.bb4c8ff
pkgrel=1
pkgdesc="A source code tags extractor"
arch=('any')
url="https://github.com/FunkyAss/luatodo"
license=('MIT')
depends=('lua-filesystem')
makedepends=('git')
install=luatodo.install
source=('git+https://github.com/FunkyAss/luatodo.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  install -D -m644 \
    LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -D -m644 README "${pkgdir}/usr/share/doc/${pkgname%-git}/README"
  # makepkg will compress this for us
  install -D -m644 doc/luatodo.1 "${pkgdir}/usr/share/man/man1/luatodo.1"
  install -D -m755 luatodo.lua "${pkgdir}/usr/bin/luatodo"
}

# vim:set ts=2 sw=2 et:
