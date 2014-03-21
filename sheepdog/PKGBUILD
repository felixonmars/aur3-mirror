# Maintainer: Nathan Baum <n-aur at p12a.org.uk>
pkgname=sheepdog
pkgver=0.8.0
pkgrel=1
pkgdesc="Distributed storage system for QEMU/KVM"
arch=('x86_64')
url="http://www.osrg.net/sheepdog/"
license=('GPLv2')
depends=('corosync>=0.20' 'liburcu>=0.6.0')
makedepends=('autoconf' 'automake' 'libtool' 'pkg-config')
_package_folder='sheepdog-sheepdog-f06a150'
source=("${_package_folder}.tar.gz::https://github.com/collie/sheepdog/tarball/v0.8.0"
	"sheepdog.conf.d"
	"sheepdog.rc.d"
	"sheepdog.uidgid")
install="${pkgname}.install"
md5sums=('5dfcb8ec99266b439b6fdee25027a705'
         'b9e34c4f3471c402f1138066f81fa59b'
         'bbbf12b375d22c9fadb5251f8d1edb7c'
         '1f74a7977e24af6e09f7ecca61384f40')
sha1sums=('d792667f37e02c4cbd5052c1bf6c6d78ffa24021'
          '215a93bb293089c8afbd16cb0a77d43f0366df02'
          'eb94264d90813b096aac1ee86fac5ba1c0b7bcf9'
          '36a8fa2a388553bf8c280fe71c2775bd7893da7e')

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
