# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-syntax-shakespeare-git
pkgver=20140701
pkgrel=1
pkgdesc="A set of Vim syntax files for highlighting the various HTML templating languages in Haskell"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/pbrisbin/vim-syntax-shakespeare"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/pbrisbin/vim-syntax-shakespeare)
sha256sums=('SKIP')
provides=('vim-syntax-shakespeare')
conflicts=('vim-haskell-conceal-plus-git' 'vim-syntax-shakespeare')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-syntax-shakespeare/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in after ftdetect syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
