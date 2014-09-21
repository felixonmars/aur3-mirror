# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-litecorrect-git
pkgver=20140916
pkgrel=1
pkgdesc="Lightweight auto-correction for Vim"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/reedes/vim-litecorrect"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/reedes/vim-litecorrect)
sha256sums=('SKIP')
provides=('vim-litecorrect')
conflicts=('vim-litecorrect')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.markdown "$pkgdir/usr/share/doc/vim-litecorrect/README.markdown"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
