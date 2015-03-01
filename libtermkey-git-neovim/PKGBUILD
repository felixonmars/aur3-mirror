# Maintainer: Florian Walch <florian+aur@fwalch.com>

pkgname=libtermkey-git-neovim
_commit=8c0cb7108cc63218ea19aa898968eede19e19603
pkgrel=1
pkgver=0.r355.8c0cb71
pkgdesc="Allows easy processing of keyboard entry from terminal-based programs; experimental version for neovim-git."
arch=('i686' 'x86_64')
url="http://www.leonerd.org.uk/code/libtermkey"
license=('MIT')
makedepends=('git')
depends=('unibilium')
conflicts=('libtermkey' 'libtermkey-bzr')
provides=('libtermkey')
source=("${pkgname}::git://github.com/neovim/libtermkey#commit=${_commit}")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  make PREFIX=/usr
}

package() {
  cd "${pkgname}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
