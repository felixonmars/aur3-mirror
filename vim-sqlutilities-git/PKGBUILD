# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-sqlutilities-git
pkgver=20121021
pkgrel=1
pkgdesc="Make SQL statements more readable"
arch=('any')
depends=('vim' 'vim-align')
makedepends=('git')
optdepends=('vim-dbext: Enable Vim to access several databases')
groups=('vim-plugins')
url="https://github.com/vim-scripts/SQLUtilities"
license=('GPL')
source=(${pkgname%-git}::git+https://github.com/vim-scripts/SQLUtilities)
sha256sums=('SKIP')
provides=('vim-sqlutilities')
conflicts=('vim-sqlutilities')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README "$pkgdir/usr/share/doc/vim-sqlutilities/README"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
