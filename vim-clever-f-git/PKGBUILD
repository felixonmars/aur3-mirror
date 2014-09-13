# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-clever-f-git
pkgver=20140807
pkgrel=1
pkgdesc="Extends f, F, t and T mappings for more convenience"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/rhysd/clever-f.vim"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/rhysd/clever-f.vim)
sha256sums=('SKIP')
provides=('vim-clever-f')
conflicts=('vim-clever-f')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-clever-f/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
