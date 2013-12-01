#Author: Rosario Contarino <contarino.rosario@gmail.com>

pkgname=vim-arduino-syntax
pkgver=8
pkgrel=1
pkgdesc="Vim syntax file for arduino"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2654"
license=('Vim license')
depends=('vim-runtime>=7')
source=('http://www.vim.org/scripts/download_script.php?src_id=17108')
md5sums=('9ca19d5668e35d53d546dd6c788baaba')
install='install.sh'

package() { 
  mv  "$srcdir/download_script.php?src_id=17108" $srcdir/arduino.vim
  install -Dm644 $srcdir/arduino.vim ${pkgdir}/usr/share/vim/vimfiles/syntax/arduino.vim
}

