# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-seek-git
pkgver=20131002
pkgrel=1
pkgdesc="Seek makes navigating long lines effortless, acting like f but taking two characters"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/goldfeld/vim-seek"
license=('MIT')
source=(git+https://github.com/goldfeld/vim-seek)
sha256sums=('SKIP')
provides=('vim-seek')
conflicts=('vim-seek')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/vim-seek/LICENSE"

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-seek/README.md"
  install -Dm 644 History.md "$pkgdir/usr/share/doc/vim-seek/History.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
