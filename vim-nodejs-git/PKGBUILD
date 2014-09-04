# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-nodejs-git
pkgver=20120119
pkgrel=1
pkgdesc="Node.js shebang file type detect plugin for Vim"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/mmalecki/vim-node.js"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/mmalecki/vim-node.js)
sha256sums=('SKIP')
provides=('vim-nodejs')
conflicts=('vim-nodejs')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/vim-nodejs/LICENSE"

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-nodejs/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in ftdetect; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
