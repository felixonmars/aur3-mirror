# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-vimsh-git
pkgver=20101017
pkgrel=1
pkgdesc="Terminal/Shell buffer script for Python-enabled [g]Vim"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/vim-scripts/vimsh.tar.gz"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/vim-scripts/vimsh.tar.gz)
sha256sums=('SKIP')
provides=('vim-vimsh')
conflicts=('vim-vimsh')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg 'Moving vimsh.py to plugins directory...'
  mv vimsh.py plugin/
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 CHANGELOG "$pkgdir/usr/share/doc/vim-vimsh/CHANGELOG"
  install -Dm 644 README "$pkgdir/usr/share/doc/vim-vimsh/README"
  install -Dm 644 TODO "$pkgdir/usr/share/doc/vim-vimsh/TODO"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
