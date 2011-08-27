# Contributor: Henry Jensen <hjensen@delilinux.de>
pkgname=iscsitarget-kernel
pkgver=1.4.20.1
pkgrel=1
pkgdesc="An opensource iSCSI target - kernel module"
url="http://iscsitarget.sourceforge.net"
license="GPL-2"
arch=('i686')
rundepends=('kernel26')
depends=('kernel26' 'openssl')
install=iscsitarget.install
source=(http://downloads.sourceforge.net/project/iscsitarget/iscsitarget/$pkgver/iscsitarget-$pkgver.tar.gz)
md5sums=('6e5e641b832d420e030d5efb59eca7ce')


build() {
  cd $startdir/src/iscsitarget-$pkgver
  export KERNSRC=/usr/src/linux-$(uname -r)
  sed -i 's/slackware-version/arch-release/' Makefile
  make kernel || return 1
  make DISTDIR=$startdir/pkg install-kernel
}
