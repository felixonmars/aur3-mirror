# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-fireplace-git
pkgver=20140902
pkgrel=1
pkgdesc="Clojure REPL support, by tpope"
arch=('any')
depends=('vim' 'vim-clojure-static-git')
makedepends=('git')
optdepends=('vim-classpath-git: run code when no REPL is available, useless and possibly slow if you only care about nREPL support'
            'vim-leiningen-git: assorted static project support')
groups=('vim-plugins')
url="https://github.com/tpope/vim-fireplace"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/tpope/vim-fireplace)
sha256sums=('SKIP')
provides=('vim-fireplace')
conflicts=('vim-fireplace')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.markdown "$pkgdir/usr/share/doc/vim-fireplace/README.markdown"
  install -Dm 644 CONTRIBUTING.markdown "$pkgdir/usr/share/doc/vim-fireplace/CONTRIBUTING.markdown"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload doc plugin python; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
