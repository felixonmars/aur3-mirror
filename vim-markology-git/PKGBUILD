# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-markology-git
pkgver=20140824
pkgrel=1
pkgdesc="Vim mark visualization, navigation and management"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/jeetsukumaran/vim-markology"
license=('MIT')
source=(git+https://github.com/jeetsukumaran/vim-markology)
sha256sums=('SKIP')
provides=('vim-markology')
conflicts=('vim-markology')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.txt "$pkgdir/usr/share/doc/vim-markology/README.txt"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
