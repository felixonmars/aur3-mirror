# Maintainer: Ansgar Taflinski <ataflinski@uni-koblenz.de>
pkgname=libvirt-sandbox
pkgver=0.5.0
pkgrel=1
pkgdesc="An extension to libvirt which allows sandboxing on top of qemu/KVM and LXC"
arch=(i686 x86_64)
url="http://www.libvirt.org"
license=('GPL')
install=libvirt-sandbox.install
depends=('libvirt-glib>=0.1.7' 'glib2>=2.28.0' 'libvirt>=1.0.2' 'cpio')
source=(ftp://libvirt.org/libvirt/sandbox/$pkgname-$pkgver.tar.gz libvirt-sandbox.install)
conflicts=('libvirt-sandbox-git')
md5sums=('7ad2d1353bb08a1c2496fc9badcc8049'
         '216c16f75110a29dd9a3ea14d2340f7f')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libdir=/usr/lib
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
