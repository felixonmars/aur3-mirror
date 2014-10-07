# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-egs-git
pkgver=20130607
pkgrel=1
pkgdesc="EGS template for Vim"
arch=('any')
depends=('vim' 'vim-gorillascript-git')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/unc0/vim-egs"
license=('WTFPL')
source=(git+https://github.com/unc0/vim-egs)
sha256sums=('SKIP')
provides=('vim-egs')
conflicts=('vim-egs')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 Copying.md "$pkgdir/usr/share/licenses/vim-egs/Copying.md"

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-egs/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in ftdetect syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
