# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-textobj-entire-git
pkgver=20140228
pkgrel=1
pkgdesc="Text objects to select the entire content of a buffer"
arch=('any')
depends=('vim' 'vim-textobj-user-git')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/kana/vim-textobj-entire"
license=('MIT')
source=(git+https://github.com/kana/vim-textobj-entire)
sha256sums=('SKIP')
provides=('vim-textobj-entire')
conflicts=('vim-textobj-entire')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-textobj-entire/README.md"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in doc plugin; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
