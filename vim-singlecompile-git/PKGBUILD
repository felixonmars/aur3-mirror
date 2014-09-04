# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-singlecompile-git
pkgver=20140611
pkgrel=1
pkgdesc="Compile or run a single source file without leaving Vim"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/xuhdev/SingleCompile"
license=('GPL3')
source=(${pkgname%-git}::git+https://github.com/xuhdev/SingleCompile)
sha256sums=('SKIP')
provides=('vim-singlecompile')
conflicts=('vim-singlecompile')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 COPYING "$pkgdir/usr/share/licenses/vim-singlecompile/COPYING"

  msg 'Installing docs...'
  install -Dm 644 README.rst "$pkgdir/usr/share/doc/vim-singlecompile/README.rst"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
