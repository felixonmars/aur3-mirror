_pkgname=vim-heroku
pkgname=vim-heroku-git
pkgver=1402985576
pkgrel=1
pkgdesc="heroku.vim: Heroku toolbelt and hk wrapper"
arch=('any')
url='https://github.com/tpope/vim-heroku'
license=('custom:vim')
depends=('vim')
makedepends=('git')
provides=('vim-heroku')
conflicts=('vim-heroku')

source=('git://github.com/tpope/vim-heroku.git')
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

