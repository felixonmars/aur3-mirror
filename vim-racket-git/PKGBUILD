# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-racket-git
pkgver=20140823
pkgrel=1
pkgdesc="Vim bundle for Racket"
arch=('any')
depends=('vim')
makedepends=('git')
optdepends=('scmindent-git: improved indentation'
            'vim-scribble: syntax for scribble')
groups=('vim-plugins')
url="https://github.com/wlangstroth/vim-racket"
license=('custom:vim')
source=(git+https://github.com/wlangstroth/vim-racket)
sha256sums=('SKIP')
provides=('vim-racket')
conflicts=('vim-racket')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-racket/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in ftdetect ftplugin indent syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
