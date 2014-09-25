# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-slime-git
pkgver=20140830
pkgrel=1
pkgdesc="Grab some text and send it to a GNU Screen / tmux session"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/jpalardy/vim-slime"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/jpalardy/vim-slime)
sha256sums=('SKIP')
provides=('vim-slime')
conflicts=('vim-slime')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/vim-slime/LICENSE.txt"

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-slime/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in doc ftplugin plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
