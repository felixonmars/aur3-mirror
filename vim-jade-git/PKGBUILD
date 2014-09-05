# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-jade-git
pkgver=20140729
pkgrel=1
pkgdesc="Jade template engine syntax highlighting and indentation"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/digitaltoad/vim-jade"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/digitaltoad/vim-jade)
sha256sums=('SKIP')
provides=('vim-jade')
conflicts=('vim-jade')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.markdown "$pkgdir/usr/share/doc/vim-jade/README.markdown"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in ftdetect ftplugin indent syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
