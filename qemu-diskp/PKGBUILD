pkgname=qemu-diskp
pkgver=1.0c
pkgrel=1
pkgdesc="QEMU disk mounter"
arch=('i686' 'x86_64')
url="http://www.saulsbury.org/software/virtualization.html"
license=GPL
depends=('fuse')
source=("http://www.saulsbury.org/software/$pkgname-$pkgver.tgz")
md5sums=('07c989498fce24929ab128395c126f11')

build ()
{
  cd $srcdir/$pkgname
  make 
  mkdir -p $pkgdir/usr/bin
  cp qemu-diskp $pkgdir/usr/bin
}
