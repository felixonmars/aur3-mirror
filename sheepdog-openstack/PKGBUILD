# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=sheepdog-openstack
_pkgname=sheepdog
pkgver=0.6.0
pkgrel=1
pkgdesc="Distributed storage system for QEMU/KVM"
arch=('x86_64')
url="http://www.osrg.net/sheepdog/"
license=('GPLv2')
depends=('corosync>=0.20'
         'liburcu>=0.6.0')
makedepends=('autoconf' 'automake' 'libtool' 'pkg-config')
_package_folder='sheepdog-sheepdog-b750524'
source=("${_package_folder}.tar.gz::https://github.com/collie/sheepdog/tarball/v0.6.0"
	"sheepdog.conf.d"
	"sheepdog.rc.d"
	"sheepdog.uidgid")
install="${_pkgname}.install"
md5sums=('0c17bc4b4c872ea9ae3e7221f4413947'
         'b9e34c4f3471c402f1138066f81fa59b'
         'bbbf12b375d22c9fadb5251f8d1edb7c'
         '1f74a7977e24af6e09f7ecca61384f40')

build() {
  cd "$srcdir/$_package_folder"
  ./autogen.sh
  ./configure --prefix=/usr \
	      --sysconfdir=/etc \
	      --localstatedir=/var
  make
}

package() {
  cd "$srcdir"
  # use custom init script
  install -D sheepdog.conf.d "${pkgdir}/etc/conf.d/sheepdog"
  install -D sheepdog.rc.d "${pkgdir}/etc/rc.d/sheepdog"
  # configure corosync for running sheepdog as non-root user
  install -D sheepdog.uidgid "${pkgdir}/etc/corosync/uidgid.d/sheepdog"
  cd "$_package_folder"
  make DESTDIR="$pkgdir/" install
  rm -r "${pkgdir}/etc/init.d"
}
