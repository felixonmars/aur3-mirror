# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-bufsync-git
pkgver=20140706
pkgrel=1
pkgdesc="Collection of heuristics to help quickly detect modifications in vim buffers"
arch=('any')
depends=('python2' 'vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/def-lkb/vimbufsync"
license=('WTFPL')
source=(${pkgname%-git}::git+https://github.com/def-lkb/vimbufsync)
sha256sums=('SKIP')
provides=('vim-bufsync')
conflicts=('vim-bufsync')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-bufsync/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
