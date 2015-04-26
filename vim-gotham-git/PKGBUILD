# Contributor: Lukas Gierth <lukas.gierth@mailbox.org>
# Maintainer: Lukas Gierth <lukas.gierth@mailbox.org>
pkgname=vim-gotham-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Gotham theme for vim"
arch=('i686' 'x86_64')
url="https://github.com/whatyouhide/vim-gotham"
license=('MIT')
groups=(vim-plugins)
depends=('vim')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=('vim-gotham-git::git://github.com/whatyouhide/vim-gotham.git')
noextract=()
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "1.0.0" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname/colors"
  mkdir -p $pkgdir/usr/share/vim/vimfiles/colors/
  install -D -m644 *.vim $pkgdir/usr/share/vim/vimfiles/colors/
}

