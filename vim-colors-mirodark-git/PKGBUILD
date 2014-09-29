# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-mirodark-git
pkgver=20131116
pkgrel=1
pkgdesc="Extends Jason W Ryan's miromiro Vim color file and dark terminal colors with gVim, Linux console, xterm-88color, and xterm-256color support"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/djjcast/mirodark"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/djjcast/mirodark)
sha256sums=('SKIP')
provides=('vim-colors-mirodark' 'vim-mirodark')
conflicts=('vim-colors-mirodark' 'vim-mirodark')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing docs...'
  install -Dm 644 README "$pkgdir/usr/share/doc/vim-colors-mirodark/README"
  cp -dpr --no-preserve=ownership screenshots "$pkgdir/usr/share/doc/vim-colors-mirodark"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in colors; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
