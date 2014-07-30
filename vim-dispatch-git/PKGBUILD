_pkgname=vim-dispatch
pkgname=vim-dispatch-git
pkgver=1405378511
pkgrel=1
pkgdesc="dispatch.vim: asynchronous build and test dispatcher"
arch=('any')
url='https://github.com/tpope/vim-dispatch'
license=('custom:vim')
depends=('vim')
makedepends=('git')
provides=('vim-dispatch')
conflicts=('vim-dispatch')

source=('git://github.com/tpope/vim-dispatch.git')
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

