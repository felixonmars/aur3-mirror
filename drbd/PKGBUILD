# Contributor: Harald Ersch <harald@ersch.ro>
# Maintainer: Edvinas Valatka <edacval@gmail.com>
pkgname=drbd
pkgver=8.3.7
pkgrel=5
arch=('i686' 'x86_64')
pkgdesc="A block device which is designed to build high availability clusters.Note: this package s deprecated and works only with <=2.6.32 kernel. For >=2.6.33 kernel use http://aur.archlinux.org/packages.php?ID=36645"
url="http://www.drbd.org"
license=('GPL')
options=(!distcc !makeflags)
makedepends=('kernel26<=2.6.32-ARCH' 'kernel26-headers<=2.6.32-ARCH' 'gcc' 'glibc' 'make' 'flex' 'patch')
source=(http://oss.linbit.com/drbd/8.3/$pkgname-$pkgver.tar.gz drbd.patch)
md5sums=('3b37c028b18bf2c8f5414396f681cf17'
         'e474b4efa871cf10a035382910ad5d53')
backup=('etc/drbd.conf')
install='drbd.install'
build() {
  cd $srcdir/drbd-$pkgver
  patch -Np1 -i ../../drbd.patch
  ./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc --with-km=yes --with-initdir=/etc/rc.d
  make DESTDIR=$pkgdir clean all install || return 1
  chmod 1777 $pkgdir/var/lock
}
