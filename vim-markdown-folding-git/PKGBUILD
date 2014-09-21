# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-markdown-folding-git
pkgver=20140903
pkgrel=1
pkgdesc="Fold markdown documents by section"
arch=('any')
depends=('vim' 'vim-markdown-git')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/nelstrom/vim-markdown-folding"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/nelstrom/vim-markdown-folding)
sha256sums=('SKIP')
provides=('vim-markdown-folding')
conflicts=('vim-markdown-folding')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-markdown-folding/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in after doc; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
