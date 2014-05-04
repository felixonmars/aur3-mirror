# $Id: PKGBUILD 187833 2013-06-06 18:34:30Z thomas $
# Contributor: Manolis Tzanidakis
# Contributor: kevin <kevin@archlinux.org>
# Maintainer: mickael9

_pkgname=ifplugd
pkgname=ifplugd-fixed
pkgver=0.28
pkgrel=14
pkgdesc="A daemon which brings up/down network interfaces upon cable insertion/removal. With buffer size patch."
arch=('i686' 'x86_64' 'armv6h')
url="http://0pointer.de/lennart/projects/ifplugd"
install=ifplugd.install
license=('GPL2')
depends=('libdaemon' 'bash')
conflicts=('ifplugd')
provides=('ifplugd=${pkgver}')
backup=('etc/ifplugd/ifplugd.conf')
options=('!makeflags' '!emptydirs')
source=($url/${_pkgname}-${pkgver}.tar.gz
        ifplugd-0.28-interface.patch
        ifplugd-fix-return-value.patch
        ifplugd-fix-buffer-size.patch
        ifplugd-daemon
        ifplugd.systemd)
md5sums=('df6f4bab52f46ffd6eb1f5912d4ccee3'
         '54eb22844b5aeed161c0b80aa9008570'
         'f26dbd7597d9d637f0b2b104b11ab820'
         'e6d06a968ee50fbccddaa3f3385e619d'
         'f2e8a37af52b79ee0e3c5bcc2470ce10'
         '3dc2ce45d0e12d155ecc7a5bc9e3ee04')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  patch -p0 -i ${srcdir}/ifplugd-0.28-interface.patch
  patch -p1 -i ${srcdir}/ifplugd-fix-return-value.patch
  patch -p1 -i ${srcdir}/ifplugd-fix-buffer-size.patch
  sed 's|/var/run|/run|' -i src/ifplugd.c
  ./configure --prefix=/usr --sbindir=/usr/bin --mandir=/usr/share/man --sysconfdir=/etc \
      --with-initdir=/etc/rc.d --disable-xmltoman --disable-subversion --disable-lynx
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

  install -D -m755 ${srcdir}/ifplugd-daemon ${pkgdir}/usr/bin/ifplugd-daemon
  # remove the default init script and action script
  rm -f ${pkgdir}/etc/{ifplugd/ifplugd.action,rc.d/ifplugd}
  # install systemd unit
  install -D -m644 ${srcdir}/ifplugd.systemd ${pkgdir}/usr/lib/systemd/system/ifplugd@.service
}
