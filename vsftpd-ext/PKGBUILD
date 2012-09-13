# Maintainer: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=vsftpd-ext
pkgver=3.0.0+ext.1
_pkgver=${pkgver/+/-}
_dirpkgver=${_pkgver/ext./ext}
pkgrel=1
pkgdesc='An extended version of the Very Secure FTP daemon'
arch=('i686' 'x86_64')
url='http://vsftpd.devnet.ru/'
license=('GPL')
depends=('glibc' 'pam' 'openssl' 'libcap>=2.16')
provides=('vsftpd')
conflicts=('vsftpd')
install=vsftpd-ext.install
backup=(etc/vsftpd/vsftpd.conf
        etc/xinetd.d/vsftpd)
source=(http://vsftpd.devnet.ru/files/3.0.0/ext.1/vsFTPd-${_dirpkgver}.tgz
        vsftpd.xinetd vsftpd.d  vsftpd-ssl.socket  vsftpd.socket
        vsftpd.service  vsftpd@.service vsftpd-ssl.service vsftpd-ssl@.service)
md5sums=('5f5b9ec90c1987a72b33cd1045e1a6b1'
         'b07fd4609c70063c1d6b20142910c1a6'
         '60060a6c7db3b3b7baa1561a302e6923'
         'fcef2cd7631f73a883a3c3d479b25cb8'
         'd05045a1244a1be9f3946578bfd0252d'
         'c773d96a61180922e36a8cea844b834b'
         '56fcbcc5c7d2c7fb49d950ac5852c601'
         '378fc06bf6407ff36a39a95545d83edc'
         '81d89213a4e679ea490c250377a799c6')

build() {
  cd $srcdir/vsFTPd-$_pkgver

  # build-time config
  sed -e 's|^#undef VSF_BUILD_SSL$|#define VSF_BUILD_SSL|' -i builddefs.h
  sed -e 's|-lwrap ||g' -i Makefile

  CFLAGS+=' -fPIE' LINK='' LDFLAGS="-fPIE -pie ${LDFLAGS} -Wl,-z,now" make
}

package() {
  cd $srcdir/vsFTPd-${_pkgver}

  install -D -m755 vsftpd $pkgdir/usr/sbin/vsftpd
  install -D -m644 vsftpd.conf "$pkgdir"/etc/vsftpd/vsftpd.conf

  install -D -m644 vsftpd.8 $pkgdir/usr/share/man/man8/vsftpd.8
  install -D -m644 vsftpd.conf.5 $pkgdir/usr/share/man/man5/vsftpd.conf.5
  find $pkgdir/usr/share/man -type f | xargs gzip -9

  install -D -m644 $srcdir/vsftpd.xinetd $pkgdir/etc/xinetd.d/vsftpd
  install -D -m755 $srcdir/vsftpd.d $pkgdir/etc/rc.d/vsftpd
  install -D -m644 $srcdir/vsftpd.service $pkgdir/usr/lib/systemd/system/vsftpd.service
  install -D -m644 $srcdir/vsftpd@.service $pkgdir/usr/lib/systemd/system/vsftpd@.service 
  install -D -m644 $srcdir/vsftpd-ssl.service $pkgdir/usr/lib/systemd/system/vsftpd-ssl.service
  install -D -m644 $srcdir/vsftpd-ssl@.service $pkgdir/usr/lib/systemd/system/vsftpd-ssl@.service
  install -D -m644 $srcdir/vsftpd.socket $pkgdir/usr/lib/systemd/system/vsftpd.socket
  install -D -m644 $srcdir/vsftpd-ssl.socket $pkgdir/usr/lib/systemd/system/vsftpd-ssl.socket

  install -d -m755 "$pkgdir"/usr/share/empty
}

# vim:set ts=2 sw=2 et:
