# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-gorillascript-git
pkgver=20140630
pkgrel=1
pkgdesc="GorillaScript Vim plugin"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/unc0/vim-gorilla-script"
license=('WTFPL')
source=(${pkgname%-git}::git+https://github.com/unc0/vim-gorilla-script)
sha256sums=('SKIP')
provides=('vim-gorillascript')
conflicts=('vim-gorillascript')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 Copying.md "$pkgdir/usr/share/licenses/vim-gorillascript/Copying.md"

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-gorillascript/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in after autoload compiler doc ftdetect ftplugin indent syntastic_checker syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
