# Maintainer:  Bartlomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jason Pierce <`echo 'moc tod liamg ta nosaj tod ecreip' | rev`>
# Contributor: Jeremy Cowgar <jeremy@cowgar.com>

pkgname=dropbear
pkgver=2012.55
pkgrel=1
pkgdesc="Lightweight replacement for sshd"
arch=('i686' 'x86_64')
url="http://matt.ucc.asn.au/dropbear/dropbear.html"
license=('MIT')
depends=('zlib')
backup=(etc/conf.d/dropbear)
source=(http://matt.ucc.asn.au/$pkgname/releases/$pkgname-$pkgver.tar.bz2
        $pkgname-conf.d
        $pkgname-rc.d)
md5sums=('8c784baec3054cdb1bb4bfa792c87812'
         '43e74541a345f149f1b5a82057a354b8'
         '033ce263f0570ec8603fc39e7ab3e743')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  sed -i 's|usr/libexec/sftp|usr/lib/ssh/sftp|' options.h

  ./configure --prefix=/usr
  LIBS="-lcrypt" make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver

  make prefix=${pkgdir}/usr install

 #man pages
  install -D -m644 dbclient.1 ${pkgdir}/usr/share/man/man1/dbclient.1
  install -D -m644 $pkgname.8 ${pkgdir}/usr/share/man/man8/$pkgname.8
  install -D -m644 dropbearkey.8 ${pkgdir}/usr/share/man/man8/dropbearkey.8

 #configuration files
  install -d ${pkgdir}/etc/$pkgname
  install -D -m644 ${srcdir}/$pkgname-conf.d ${pkgdir}/etc/conf.d/$pkgname
  install -D -m755 ${srcdir}/$pkgname-rc.d ${pkgdir}/etc/rc.d/$pkgname

 #license file
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
