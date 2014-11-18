# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-dutyl-git
pkgver=20141017
pkgrel=1
pkgdesc="Coordinate D tools to work together for you"
arch=('any')
depends=('dcd' 'dscanner' 'dub' 'vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/idanarye/vim-dutyl"
license=('MIT')
source=(git+https://github.com/idanarye/vim-dutyl)
sha256sums=('SKIP')
provides=('vim-dutyl')
conflicts=('vim-dutyl')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload doc ftplugin plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
