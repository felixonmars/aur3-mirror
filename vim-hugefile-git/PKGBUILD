# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-hugefile-git
pkgver=20131027
pkgrel=1
pkgdesc="Speed up loading of large files"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/mhinz/vim-hugefile"
license=('GPL3')
source=(git+https://github.com/mhinz/vim-hugefile)
sha256sums=('SKIP')
provides=('vim-hugefile')
conflicts=('vim-hugefile')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-hugefile/README.md"
  install -Dm 644 CONTRIBUTING.md "$pkgdir/usr/share/doc/vim-hugefile/CONTRIBUTING.md"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in autoload doc plugin; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
