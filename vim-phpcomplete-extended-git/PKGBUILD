# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-phpcomplete-extended-git
pkgver=20140727
pkgrel=1
pkgdesc="Fast, extensible, context aware autocomplete plugin for PHP composer projects"
arch=('any')
depends=('vim' 'vim-unite-git' 'vim-vimproc' 'vim-vital-git')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/m2mdas/phpcomplete-extended"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/m2mdas/phpcomplete-extended)
sha256sums=('SKIP')
provides=('vim-phpcomplete-extended')
conflicts=('vim-phpcomplete-extended')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-phpcomplete-extended/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload bin doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Removing vital.vim (provided by vim-vital-git)'
  rm -f "$pkgdir/usr/share/vim/vimfiles/autoload/vital.vim"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
