# Maintainer: speps <speps dot aur dot archlinux dot org>

pkgname=gnulib
pkgver=0.1
pkgrel=1
pkgdesc="The GNU Portability Library"
arch=('any')
url="http://www.gnu.org/software/gnulib/"
license=('GPL' 'GPL3' 'LGPL' 'LGPL3' 'FDL1.3')
source=("http://git.savannah.gnu.org/cgit/gnulib.git/snapshot/$pkgname-$pkgver.tar.gz")
md5sums=('SKIP')

prepare() {
  cd $pkgname-$pkgver

  # set proper gnulib_dir in gnulib-tool
  sed -i '/^  gnulib_dir=/s|=.*|=/usr/share/gnulib|' gnulib-tool
}

package() {
  cd $pkgname-$pkgver

  # bundle
  find -type d -exec install -d {} ${pkgdir}/usr/share/$pkgname/{} \;
  find -type f ! -name ".*" -exec install -D {} ${pkgdir}/usr/share/$pkgname/{} \;

  # links
  install -d "$pkgdir/usr/bin"
  ln -s /usr/share/gnulib/gnulib-tool  "$pkgdir/usr/bin"
  ln -s /usr/share/gnulib/check-module "$pkgdir/usr/bin"
}
