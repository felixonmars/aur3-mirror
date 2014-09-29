# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-vital-over-git
pkgver=20140828
pkgrel=1
pkgdesc="Vim cmdline framework"
arch=('any')
depends=('vim' 'vim-vital-git')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/osyo-manga/vital-over"
license=('NYSL')
source=(${pkgname%-git}::git+https://github.com/osyo-manga/vital-over)
sha256sums=('SKIP')
provides=('vim-vital-over')
conflicts=('vim-vital-over')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-vital-over/README.md"
  cp -dpr --no-preserve=ownership example "$pkgdir/usr/share/doc/vim-vital-over"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload doc; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
