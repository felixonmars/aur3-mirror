# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-mimicpak
pkgver=1.0
_srcid=11619
pkgrel=1
pkgdesc="The MimicPak is a set of 17 colorschemes which were converted from other editors"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=2831"
license=('custom:vim')
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=$_srcid)
sha256sums=('5bbb99ec10730aa2cf7cde9ce9e90cf628a5395e569ff1ef697da335fb531ed4')
conflicts=('vim-colorsamplerpack')
install=mimicpak.install

package() {
  cd "$srcdir/mimicpak"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in colors doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done
}
