# Maintainer: Distag
pkgname=vimplate
pkgver=0.2.3
pkgrel=1
pkgdesc="Vimplate provides an extensible and powerful template processing system."
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=1311"
license=('GPL')
depends=('perl-template-toolkit' 'vim>=6.0')
source=(${pkgname}.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=4504)
md5sums=('7f57fa519c1796a69c0304f24203eb0e')
install=${pkgname}.install

build() {
  cd $srcdir/$pkgname

  install -D -m 755 vimplate ${pkgdir}/usr/bin/vimplate

  install -d -m 755 ${pkgdir}/usr/share/vim/vimfiles
  cp -r {doc,plugin} ${pkgdir}/usr/share/vim/vimfiles/

  install -d -m 755 ${pkgdir}/usr/share/vimplate
  cp -r Templates ${pkgdir}/usr/share/vimplate/
}
