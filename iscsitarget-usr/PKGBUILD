# Contributor: Henry Jensen <hjensen@delilinux.de>
pkgname=iscsitarget-usr
pkgver=1.4.20.1
pkgrel=1
pkgdesc="An opensource iSCSI target - userland binaries"
url="http://iscsitarget.sourceforge.net"
license="GPL-2"
arch=('i686')
rundepends=('glibc')
depends=('glibc' 'openssl' 'iscsitarget-kernel')
source=(http://downloads.sourceforge.net/project/iscsitarget/iscsitarget/$pkgver/iscsitarget-$pkgver.tar.gz)
md5sums=('6e5e641b832d420e030d5efb59eca7ce')


build() {
  cd $startdir/src/iscsitarget-$pkgver
  sed -i 's/slackware-version/arch-release/' Makefile
  gzip -c doc/manpages/ietd.conf.5 > doc/manpages/ietd.conf.5.gz
  gzip -c doc/manpages/ietd.8 > doc/manpages/ietd.8.gz
  make usr || return 1
  make DISTDIR=$startdir/pkg install-usr install-etc install-doc
  install -D -m755 etc/ietd.conf $startdir/pkg/etc/ietd.conf.sample
}
