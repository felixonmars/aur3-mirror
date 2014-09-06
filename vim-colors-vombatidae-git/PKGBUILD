# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-vombatidae-git
pkgver=20130518
pkgrel=1
pkgdesc="Mix of the desert256 and wombat themes for 256 color terminals and gui only"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/octol/vombatidae-vim"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/octol/vombatidae-vim)
sha256sums=('SKIP')
provides=('vim-colors-vombatidae' 'vim-vombatidae')
conflicts=('vim-colors-vombatidae' 'vim-vombatidae')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing docs...'
  install -Dm 644 README "$pkgdir/usr/share/doc/vim-colors-vombatidae/README"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in colors; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
