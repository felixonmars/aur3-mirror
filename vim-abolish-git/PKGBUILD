_pkgname=vim-abolish
pkgname=vim-abolish-git
pkgver=1399239382
pkgrel=1
pkgdesc="This plugin is three superficially unrelated plugins in one that share a common theme: working with variants of a word."
arch=('any')
url='https://github.com/tpope/vim-abolish'
license=('custom:vim')
depends=('vim')
makedepends=('git')
provides=('vim-abolish')
conflicts=('vim-abolish')

source=('git://github.com/tpope/vim-abolish.git')
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

