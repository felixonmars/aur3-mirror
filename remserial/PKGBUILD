# Maintainer Gareth John <gljohn@fedoraproject.org>
# Contributor: oldbay <old_bay@mail.ru>

pkgname=remserial
pkgver=1.4
pkgrel=2
pkgdesc="A program that acts as a communications bridge between a TCP/IP network port and a Linux device such as a serial port"
arch=('i686' 'x86_64')
url="http://lpccomp.bc.ca"
license=('GPL')
depends=('bash')
makedepends=('make')
source=($url/$pkgname/$pkgname-$pkgver.tar.gz
remserial
remserial.conf)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir ${pkgdir}/usr
  mkdir ${pkgdir}/usr/bin
  mkdir ${pkgdir}/etc
  mkdir ${pkgdir}/etc/rc.d
  chmod 755 /usr
  chmod 755 /usr/bin
  chmod 755 /etc
  chmod 755 /etc/rc.d
  cp -a $srcdir/$pkgname-$pkgver/remserial ${pkgdir}/usr/bin/
  install -D -m644 $startdir/remserial.conf ${pkgdir}/etc/remserial.conf
  install -D -m755 $startdir/remserial ${pkgdir}/etc/rc.d/remserial
}
md5sums=('b19b57fd118329c5ea3aaf9887f946a6'
         'bbd16e0725f00d2c0050837b3d4ea186'
         '48dd8ce453b84fd080540b4e3e0be50c')
