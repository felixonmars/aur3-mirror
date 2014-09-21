# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-pencil-git
pkgver=20140903
pkgrel=1
pkgdesc="A light (and dark) color scheme for Vim inspired by iA Writer"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/reedes/vim-colors-pencil"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/reedes/vim-colors-pencil)
sha256sums=('SKIP')
provides=('vim-colors-pencil')
conflicts=('vim-colors-pencil')
install=pencil.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/vim-colors-pencil/LICENSE"

  msg 'Installing docs...'
  install -Dm 644 README.markdown "$pkgdir/usr/share/doc/vim-colors-pencil/README.markdown"
  cp -dpr --no-preserve=ownership screenshots "$pkgdir/usr/share/doc/vim-colors-pencil"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in autoload colors; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
