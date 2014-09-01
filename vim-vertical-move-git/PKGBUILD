# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-vertical-move-git
pkgver=20140202
pkgrel=1
pkgdesc="Move up and down without changing the cursor column"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/bruno-/vim-vertical-move"
license=('MIT')
source=(git+https://github.com/bruno-/vim-vertical-move)
sha256sums=('SKIP')
provides=('vim-vertical-move')
conflicts=('vim-vertical-move')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-vertical-move/README.md"
  cp -dpr --no-preserve=ownership examples "$pkgdir/usr/share/doc/vim-vertical-move"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
