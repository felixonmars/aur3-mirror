# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colortoggle-git
pkgver=20131127
pkgrel=1
pkgdesc="Vim plugin for toggling background and color scheme"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/saghul/vim-colortoggle"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/saghul/vim-colortoggle)
sha256sums=('SKIP')
provides=('vim-colortoggle')
conflicts=('vim-colortoggle')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-colortoggle/README.md"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in plugin; do
    cp -R $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
