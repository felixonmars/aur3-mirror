# Maintainer: Boris Staletic <boris[dot]staletic[at]gmail[dot]com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-singlecompile
pkgver=2.12.0
_srcid=22022
pkgrel=6
pkgdesc="Compile or run a single source file without leaving Vim"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://singlecompile.topbug.net"
license=('GPL3')
source=(${pkgname}-$pkgver.zip::http://www.vim.org/scripts/download_script.php?src_id=${_srcid})
sha256sums=('fada4bfd1b07cffacf3007fff690741a9e76e43ca357b2fdb0a28e2e89ad7855')
install=vimdoc.install

package() {
  cd "$srcdir"

  msg 'Installing...'
  install -dm 755 $pkgdir/usr/share/vim/vimfiles
  for _appdir in autoload plugin doc; do
      cp -dpr --no-preserve=ownership $_appdir $pkgdir/usr/share/vim/vimfiles/$_appdir
    done
}
