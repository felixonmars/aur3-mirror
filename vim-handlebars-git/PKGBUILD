# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-handlebars-git
pkgver=20131027
pkgrel=1
pkgdesc="Vim plugin for Handlebars"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/nono/vim-handlebars"
license=('MIT')
source=(git+https://github.com/nono/vim-handlebars)
sha256sums=('SKIP')
provides=('vim-handlebars')
conflicts=('vim-handlebars')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg 'Removing unneeded files...'
  rm MIT-LICENSE README.md example.handlebars
}

package() {
  cd ${pkgname%-git}

  msg 'Installing...'
  install -dm 755 ${pkgdir}/usr/share/vim/vimfiles/
  tar -c . | tar -x -C ${pkgdir}/usr/share/vim/vimfiles

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
