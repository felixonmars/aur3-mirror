# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-kivy-git
pkgver=20130214
pkgrel=1
pkgdesc="Vim syntax for Kivy language"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/ajford/vimkivy"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/ajford/vimkivy)
sha256sums=('SKIP')
provides=('vim-kivy')
conflicts=('vim-kivy')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing docs...'
  install -Dm 644 README.mkd "$pkgdir/usr/share/doc/vim-kivy/README.mkd"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in ftplugin plugin syntax; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
