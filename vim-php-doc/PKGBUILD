# Maintainer: Laszlo Papp <djszapi @ gmail at com>
# Maintainer: Hexcles Ma <bob1211 (at) gmail (dot) com>

pkgname=vim-php-doc
pkgver=1.0.1
_scriptid=4666
pkgrel=6
pkgdesc="Provides really comfortable generation of phpDocumentor doc blocks for PHP4 & 5"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=1355"
license=('GPL')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(php-doc.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        php-doc.patch)
md5sums=('41c58d30bb54b27deb8449a8d4e5c2cd'
         'd20bad053bb119b10f39b562bf0f554f')

build() {
  cd ${srcdir}
  patch --follow-symlinks -i php-doc.patch
}

package() {
  install -Dm644 php-doc.vim ${pkgdir}/usr/share/vim/vimfiles/ftplugin/php/php-doc.vim || return 1
}
