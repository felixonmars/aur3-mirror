# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-flavored-markdown-git
pkgver=20130715
pkgrel=1
pkgdesc="Add-on to tpope's markdown.vim to highlight using Github Flavored Markdown"
arch=('any')
depends=('vim' 'vim-markdown')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/jtratner/vim-flavored-markdown"
license=('MIT')
source=(git+https://github.com/jtratner/vim-flavored-markdown)
sha256sums=('SKIP')
provides=('vim-flavored-markdown')
conflicts=('vim-flavored-markdown')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-flavored-markdown/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
