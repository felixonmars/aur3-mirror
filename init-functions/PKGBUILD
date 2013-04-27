
pkgname=init-functions
pkgver=4.0
pkgrel=4
pkgdesc="Functions used at init time by the Linux Standard Base"
arch=('x86_64')
url="http://www.linuxbase.org"
license=('GPL')
source=(http://archive.ubuntu.com/ubuntu/pool/main/l/lsb/lsb_4.0-0ubuntu27.tar.gz)

package() {

  cd $srcdir/lsb-$pkgver
  mkdir -p $pkgdir/usr/lib/lsb
  cp init-functions initdutils.py install_initd lsbinstall remove_initd $pkgdir/usr/lib/lsb/
  echo $pkgdir
}
md5sums=('a4fd987f7c8f5210a2fea5b809f4976a')
