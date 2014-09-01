# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vimux-git
pkgver=20140714
pkgrel=1
pkgdesc="Easily interact with tmux from Vim"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/benmills/vimux"
license=('MIT')
source=(git+https://github.com/benmills/vimux)
sha256sums=('SKIP')
provides=('vimux')
conflicts=('vimux')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/vimux/LICENSE"

  msg 'Installing documentation...'
  install -Dm 644 README.mkd "$pkgdir/usr/share/doc/vimux/README.mkd"

  msg 'Installing appdirs...'
  install -dm 755 $pkgdir/usr/share/vim/vimfiles
  for _appdir in doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
