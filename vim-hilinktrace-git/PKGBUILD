# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-hilinktrace-git
pkgver=20110221
pkgrel=1
pkgdesc="Trace Vim syntax highlighting rules"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/gerw/vim-HiLinkTrace"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/gerw/vim-HiLinkTrace)
sha256sums=('SKIP')
provides=('vim-hilinktrace')
conflicts=('vim-hilinktrace')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing appdirs...'
  install -Dm 644 doc/hilinks.txt "$pkgdir/usr/share/vim/vimfiles/doc/hilinks.txt"
  for _appdir in doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
