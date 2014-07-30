_pkgname=vim-tbone
pkgname=vim-tbone-git
pkgver=1404075339
pkgrel=1
pkgdesc="tbone.vim: tmux basics"
arch=('any')
url='https://github.com/tpope/vim-tbone'
license=('custom:vim')
depends=('vim')
makedepends=('git')
provides=('vim-tbone')
conflicts=('vim-tbone')

source=('git://github.com/tpope/vim-tbone.git')
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

