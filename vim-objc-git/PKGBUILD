# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-objc-git
pkgver=20140228
pkgrel=1
pkgdesc="Improved indentation and updated syntax highlighting for Objective-C 2.0, by Björn Winckler"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/b4winckler/vim-objc"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/b4winckler/vim-objc)
sha256sums=('SKIP')
provides=('vim-objc')
conflicts=('vim-objc')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.markdown "$pkgdir/usr/share/doc/vim-objc/README.markdown"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in after ftplugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
