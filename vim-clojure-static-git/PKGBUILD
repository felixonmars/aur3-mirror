# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-clojure-static-git
pkgver=20140721
pkgrel=1
pkgdesc="Meikel Brandmeyer's excellent Clojure runtime files, extracted from the VimClojure project for use with alternate Clojure REPL plugins"
arch=('any')
depends=('vim')
makedepends=('git')
optdepends=('vim-classpath: sets the path to match the class path of your current Clojure project'
            'vim-clojure-highlight-git: extended syntax highlighting for referred and aliased vars in Clojure buffers'
            'vim-clojure-sql: SQL syntax highlighting'
            'vim-fireplace-git: nREPL client by Tim Pope'
            'vim-leiningen-git: static support for Leiningen'
            'vim-rainbow-parentheses-git: rainbow parentheses syntax highlighting')
groups=('vim-plugins')
url="https://github.com/guns/vim-clojure-static"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/guns/vim-clojure-static)
sha256sums=('SKIP')
provides=('vim-clojure-static')
conflicts=('vim-clojure' 'vimclojure' 'vim-clojure-static')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/vim-clojure-static/LICENSE.txt"

  msg 'Installing documentation...'
  install -Dm 644 README.markdown "$pkgdir/usr/share/doc/vim-clojure-static/README.markdown"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload clj doc ftdetect ftplugin indent syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
