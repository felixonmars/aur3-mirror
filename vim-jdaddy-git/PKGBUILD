_pkgname=vim-jdaddy
pkgname=vim-jdaddy-git
pkgver=1392323007
pkgrel=1
pkgdesc="jdaddy.vim: JSON manipulation and pretty printing"
arch=('any')
url='https://github.com/tpope/vim-jdaddy'
license=('custom:vim')
depends=('vim')
makedepends=('git')
provides=('vim-jdaddy')
conflicts=('vim-jdaddy')

source=('git://github.com/tpope/vim-jdaddy.git')
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

