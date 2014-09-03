# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-clojure-highlight-git
pkgver=20140404
pkgrel=1
pkgdesc="Extend builtin syntax highlighting to referred and aliased vars in Clojure buffers"
arch=('any')
depends=('vim' 'vim-clojure-static-git' 'vim-fireplace-git')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/guns/vim-clojure-highlight"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/guns/vim-clojure-highlight)
sha256sums=('SKIP')
provides=('vim-clojure-highlight')
conflicts=('vim-clojure-highlight')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.markdown "$pkgdir/usr/share/doc/vim-clojure-highlight/README.markdown"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
