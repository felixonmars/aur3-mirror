# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-cpp-git
pkgver=20140516
pkgrel=1
pkgdesc="Bram Moolenaar's c.vim and Ken Shan's cpp.vim with C++11 support added"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/vim-jp/cpp-vim"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/vim-jp/cpp-vim)
sha256sums=('SKIP')
provides=('vim-cpp')
conflicts=('vim-cpp')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.mkd "$pkgdir/usr/share/doc/vim-cpp/README.mkd"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
