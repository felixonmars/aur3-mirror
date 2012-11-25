# Maintainer: josephgbr <rafael.f.f1 at gmail.com>
# Contributor: webmjm <web.jdm at gmail.com>

_pkgbase=hal
pkgname=lib32-${_pkgbase}
pkgver=0.5.14
pkgrel=8
pkgdesc="Hardware Abstraction Layer (32 Bit)"
arch=('x86_64')
license=('GPL' 'custom:AFL')
url="http://www.freedesktop.org/wiki/Software/hal"
depends=('lib32-dbus-glib' 'lib32-libusb-compat' 'lib32-util-linux' $_pkgbase)
makedepends=('gcc-multilib' 'gperf' 'hal-info' 'eject' 'filesystem' 'usbutils'
             'pm-utils' 'pciutils' 'dmidecode' 'lib32-systemd')
options=('!libtool' '!makeflags')
source=(http://hal.freedesktop.org/releases/${_pkgbase}-${pkgver}.tar.gz
        #hald
        hal.patch
        udev-update.patch
        hal-glib-2.3-compile-fix.patch
        hal-libudev-events.patch)

md5sums=('e9163df591a6f38f59fdbfe33e73bf20'
         #'4cdfc673ad65ddb51919f5a757f62145'
         '185dd5d6ffc703ec8395b4eb3a1ae498'
         '68209ba62b2a19537bfa459fdef70ed3'
         'c126a66766118f83a171511832d1b619'
         'd115a2f1793121b08dd58527c1530d0b')

build() {
  cd "${srcdir}"
  patch -Np1 -d "${srcdir}" < hal.patch
  cd ${_pkgbase}-${pkgver}
  patch -Np1 -i "${srcdir}"/hal-libudev-events.patch
  patch -Np1 -i "${srcdir}"/hal-glib-2.3-compile-fix.patch
  patch -Np1 -i "${srcdir}"/udev-update.patch
  
  export CC='gcc -m32'
  
  libtoolize --force
  aclocal
  autoconf
  automake

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib32/${_pkgbase} --libdir=/usr/lib32 \
      --with-udev-prefix=/etc --with-pid-file=/var/run/hald.pid \
      --with-hal-user=hal --with-hal-group=hal \
      --disable-{acl-management,acpi-ibm,console-kit,docbook-docs} \
      --disable-{policy-kit,smbios,static,gtk-doc} \
      --enable-umount-helper
  make
}

package() {
  make -C ${_pkgbase}-${pkgver} DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,sbin,var,usr/{bin,include,sbin,share}}
  
  install -dm755 "${pkgdir}"/usr/share/licenses/
  ln -s ${_pkgbase} "${pkgdir}"/usr/share/licenses/${pkgname}
}
