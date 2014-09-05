# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-undotree-git
pkgver=20140804
pkgrel=1
pkgdesc="Display your undo history in a graph"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/mbbill/undotree"
license=('BSD')
source=(${pkgname%-git}::git+https://github.com/mbbill/undotree)
sha256sums=('SKIP')
provides=('vim-undotree')
conflicts=('vim-undotree')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-undotree/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in plugin syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
