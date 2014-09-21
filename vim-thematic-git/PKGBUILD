# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-thematic-git
pkgver=20140916
pkgrel=1
pkgdesc="Conveniently manage Vim’s appearance to suit your task and environment"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/reedes/vim-thematic"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/reedes/vim-thematic)
sha256sums=('SKIP')
provides=('vim-thematic')
conflicts=('vim-thematic')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/vim-thematic/LICENSE"

  msg 'Installing documentation...'
  install -Dm 644 README.markdown "$pkgdir/usr/share/doc/vim-thematic/README.markdown"
  cp -dpr --no-preserve=ownership screenshots "$pkgdir/usr/share/doc/vim-thematic"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
