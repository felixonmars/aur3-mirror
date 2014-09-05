# Maintainer: Mark Cornick <mcornick@mcornick.com>
# Contributor: lolilolicon <lolilolicon#gmail#com>
_pkgname=html5.vim
pkgname=vim-html5-git
pkgver=1409801952
pkgrel=1
pkgdesc="HTML5 omnicomplete and syntax"
arch=('any')
url='https://github.com/othree/html5.vim'
license=('MIT')
depends=('vim')
makedepends=('git')
provides=('vim-html5')
conflicts=('vim-html5')

source=('git://github.com/othree/html5.vim.git')
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

