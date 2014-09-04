# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-pipe2eval-git
pkgver=20140524
pkgrel=1
pkgdesc="Simple REPL inside Vim"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/zweifisch/pipe2eval"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/zweifisch/pipe2eval)
sha256sums=('SKIP')
provides=('vim-pipe2eval')
conflicts=('vim-pipe2eval')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-pipe2eval/README.md"
  cp -dpr --no-preserve=ownership demos "$pkgdir/usr/share/doc/vim-pipe2eval"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
