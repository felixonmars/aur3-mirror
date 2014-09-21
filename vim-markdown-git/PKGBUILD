# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-markdown-git
pkgver=20140711
pkgrel=1
pkgdesc="Vim Markdown runtime files by tpope"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/tpope/vim-markdown"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/tpope/vim-markdown)
sha256sums=('SKIP')
provides=('vim-markdown')
conflicts=('vim-markdown')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.markdown "$pkgdir/usr/share/doc/vim-markdown/README.markdown"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in ftdetect ftplugin syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
