# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-limelight-git
pkgver=20140818
pkgrel=1
pkgdesc="Hyperfocus-writing in Vim"
arch=('any')
depends=('vim')
makedepends=('git')
optdepends=('vim-goyo-git: distraction-free writing in Vim')
groups=('vim-plugins')
url="https://github.com/junegunn/limelight.vim"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/junegunn/limelight.vim)
sha256sums=('SKIP')
provides=('vim-limelight')
conflicts=('vim-limelight')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md $pkgdir/usr/share/doc/vim-limelight/README.md

  msg 'Installing appdirs...'
  install -dm 755 $pkgdir/usr/share/vim/vimfiles
  for _appdir in plugin; do
    cp -dpr --no-preserve=ownership $_appdir $pkgdir/usr/share/vim/vimfiles/$_appdir
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
