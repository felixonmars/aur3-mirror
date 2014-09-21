# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-noctu-git
pkgver=20130920
pkgrel=1
pkgdesc="A Vim color scheme for 16-color terminals"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/noahfrederick/vim-noctu"
license=('CCPL')
source=(${pkgname%-git}::git+https://github.com/noahfrederick/vim-noctu)
sha256sums=('SKIP')
provides=('vim-colors-noctu')
conflicts=('vim-colors-noctu')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-colors-noctu/README.md"
  install -Dm 644 example.png "$pkgdir/usr/share/doc/vim-colors-noctu/example.png"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in colors; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
