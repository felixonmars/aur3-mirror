# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-python-combined-git
pkgver=20131125
pkgrel=1
pkgdesc="Fork of python.vim by Dmitry Vasiliev and Neil Schemenauer for 2.x and 3.x"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/mitsuhiko/vim-python-combined"
license=('BSD')
source=(${pkgname%-git}::git+https://github.com/mitsuhiko/vim-python-combined)
sha256sums=('SKIP')
provides=('vim-python' 'vim-python-combined')
conflicts=('vim-python' 'vim-python-combined')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/vim-python-combined/LICENSE"

  msg 'Installing documentation...'
  install -Dm 644 README "$pkgdir/usr/share/doc/vim-python-combined/README"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in indent syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
