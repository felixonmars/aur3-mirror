# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-lint-git
pkgver=20130427
pkgrel=1
pkgdesc="Vim + JSHint + CSSLint + V8"
arch=('any')
depends=('csslint-git' 'nodejs-jshint' 'v8' 'vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/joestelmach/lint.vim"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/joestelmach/lint.vim)
sha256sums=('SKIP')
provides=('vim-lint')
conflicts=('vim-lint')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/vim-lint/LICENSE"

  msg 'Installing documentation...'
  install -Dm 644 README.markdown "$pkgdir/usr/share/doc/vim-lint/README.markdown"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in js plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
