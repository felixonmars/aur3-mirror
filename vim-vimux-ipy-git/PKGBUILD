# Maintainer: Eugene Yunak <e.yunak@gmail.com>

pkgname=vim-vimux-ipy-git
pkgver=20131011
pkgrel=1
pkgdesc="Send python code from vim to ipython running within a tmux split"
arch=('any')
depends=('vimux' 'ipython')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/jgors/vimux-ipy"
license=('MIT')
source=(git+https://github.com/jgors/vimux-ipy)
sha256sums=('SKIP')
install=vimdoc.install

pkgver() {
  cd vimux-ipy
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd vimux-ipy

  msg 'Removing stray files...'
  rm -f README.md
  rm -rf img
}

package() {
  cd vimux-ipy

  msg 'Installing...'
  install -dm 755 ${pkgdir}/usr/share/vim/vimfiles/
  tar -c . | tar -x -C ${pkgdir}/usr/share/vim/vimfiles

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}

