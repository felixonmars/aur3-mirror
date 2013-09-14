# Maintainer: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Bill Fraser <wfraser@codewise.org>

_pkgbase=device-mapper
pkgname=lib32-${_pkgbase}
pkgver=2.02.100
pkgrel=1
arch=('x86_64')
url="http://sourceware.org/lvm2/"
license=('GPL2' 'LGPL2.1')
pkgdesc="Device mapper userspace library and tools (32 bit)"
depends=('lib32-systemd' "${_pkgbase}")
makedepends=('lib32-readline' 'gcc-multilib')
source=(ftp://sources.redhat.com/pub/lvm2/LVM2.${pkgver}.tgz)
sha1sums=('95a4478e4a19bba2c6eb8c36b08b310a96e3944b')

build() {
  export CC='gcc -m32'
  
  cd LVM2.${pkgver}
  unset LDFLAGS

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin \
    --with-udev-prefix=/usr --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --with-default-pid-dir=/run --with-default-dm-run-dir=/run --with-default-run-dir=/run/lvm \
    --enable-pkgconfig --enable-readline --enable-dmeventd --enable-cmdlib --enable-applib \
    --enable-udev_sync --enable-udev_rules --with-default-locking-dir=/run/lock/lvm \
    --enable-lvmetad \
    --with-usrlibdir=/usr/lib32 --libdir=/usr/lib32
  make
}

package() {
  make -C LVM2.${pkgver} DESTDIR="${pkgdir}" install_device-mapper
  rm -rf "${pkgdir}"/usr/{bin,include,lib,share}
}

