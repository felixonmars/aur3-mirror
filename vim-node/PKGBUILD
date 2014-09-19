# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-node
pkgver=0.8.1
_srcid=21777
pkgrel=1
pkgdesc="Tools to make Vim superb for developing with Node.js, like vim-rails and vim-rake"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=4674"
license=('AGPL3')
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_srcid})
sha256sums=('05ce1b6887d2e6b0bb8083600f8fb0bad92ddc72e992988baa686da74f87c376')
conflicts=('vim-nodejs-git')
install=vimdoc.install

package() {
  cd "$srcdir"

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/vim-node/LICENSE"

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-node/README.md"
  install -Dm 644 CHANGELOG.md "$pkgdir/usr/share/doc/vim-node/CHANGELOG.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload ftdetect plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done
}
