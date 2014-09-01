# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-bufsurf-git
pkgver=20121207
pkgrel=1
pkgdesc="Enables surfing through buffers based on viewing history per window"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/ton/vim-bufsurf"
license=('MIT')
source=(git+https://github.com/ton/vim-bufsurf)
sha256sums=('SKIP')
provides=('vim-bufsurf')
conflicts=('vim-bufsurf')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README "$pkgdir/usr/share/doc/vim-bufsurf/README"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
