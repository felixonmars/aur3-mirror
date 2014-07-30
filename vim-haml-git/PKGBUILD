_pkgname=vim-haml
pkgname=vim-haml-git
pkgver=1402441387
pkgrel=1
pkgdesc="Vim runtime files for Haml, Sass, and SCSS"
arch=('any')
url='https://github.com/tpope/vim-haml'
license=('custom:vim')
depends=('vim')
makedepends=('git')
provides=('vim-haml')
conflicts=('vim-haml')

source=('git://github.com/tpope/vim-haml.git')
sha512sums=('SKIP')

pkgver() {
  cd -- "$srcdir/$_pkgname"
  git log -n1 --pretty=format:%ct
}

package() {
  cd "$srcdir/$_pkgname"
  install -dm755 "$pkgdir/usr/share/vim/vimfiles"
  find * -maxdepth 0 -type d -exec cp -R -t "$pkgdir/usr/share/vim/vimfiles" '{}' \+
}

