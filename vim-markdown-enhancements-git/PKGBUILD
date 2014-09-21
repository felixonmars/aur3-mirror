# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-markdown-enhancements-git
pkgver=20140124
pkgrel=1
pkgdesc="Augment your existing markdown.vim with support for MultiMarkdown, CriticMarkup, etc"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/mattly/vim-markdown-enhancements"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/mattly/vim-markdown-enhancements)
sha256sums=('SKIP')
provides=('vim-markdown-enhancements')
conflicts=('vim-markdown-enhancements')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.markdown "$pkgdir/usr/share/doc/vim-markdown-enhancements/README.markdown"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in after; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
