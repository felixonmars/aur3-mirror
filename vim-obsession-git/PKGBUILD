_pkgname=vim-obsession
pkgname=vim-obsession-git
pkgver=1403623353
pkgrel=1
pkgdesc="tpope's session creation plugin."
arch=('any')
url='https://github.com/tpope/vim-obsession'
license=('custom:vim')
depends=('vim')
makedepends=('git')
provides=('vim-obsession')
conflicts=('vim-obsession')

source=('git://github.com/tpope/vim-obsession.git')
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

