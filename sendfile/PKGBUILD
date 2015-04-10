# Maintainer: mockfrog <arch AT mockfrog DOT de>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=sendfile
pkgver=2.1b
pkgrel=1
pkgdesc="The sendfile client transfers files to the sendfile daemon of the recipient's host"
arch=(i686 x86_64)
license=('GPL2')
optdepends=('xinetd')
depends=('perl')
source=(http://fex.belwue.de/download/${pkgname}-${pkgver}.tar.gz saft.xinetd)
md5sums=('0397cbbf6261b27a1ddcbbd11ff7335c'
         '0e91e1865462e6877883dae0adb215ba')
url="http://www.belwue.de/projekte/saft/sendfile-us.html"

build() {
export MAKEFLAGS="-1"
cd ${srcdir}/${pkgname}-${pkgver}
./makeconfig BINDIR=/usr/bin CONFIG=/etc SERVERDIR=/usr/bin MANDIR=/usr/share/man
sed -i s/\\/usr\\/local\\/etc\\//\\/etc\\// ./etc/sfdconf
sed -i 1c\\'#!/usr/bin/perl -w' ./src/pussy 
make || return 1

}

package() {
mkdir -p ${pkgdir}/var/spool/sendfile/LOG
chmod 700  ${pkgdir}/var/spool/sendfile/LOG
mkdir -p ${pkgdir}/var/spool/sendfile/OUTGOING
chmod 1777 ${pkgdir}/var/spool/sendfile/OUTGOING

cd ${srcdir}/${pkgname}-${pkgver}/src
install sendfiled -D ${pkgdir}/usr/bin/sendfiled
install fetchfile -D ${pkgdir}/usr/bin/fetchfile
install pussy -D ${pkgdir}/usr/bin/pussy
install receive -D ${pkgdir}/usr/bin/receive
install sendmsg -D ${pkgdir}/usr/bin/sendmsg
install sendfile -D ${pkgdir}/usr/bin/sendfile
install utf7encode -D ${pkgdir}/usr/bin/utf7encode
install wlock -D ${pkgdir}/usr/bin/wlock
ln -s /usr/bin/utf7encode ${pkgdir}/usr/bin/utf7decode

cd ${srcdir}/${pkgname}-${pkgver}/etc
install check_sendfile -D ${pkgdir}/etc/profile.d/check_sendfile.sh

install -m644 ${startdir}/saft.xinetd -D ${pkgdir}/etc/xinetd.d/saft
install -m644 sendfile.deny -D ${pkgdir}/etc/sendfile.deny
install -m644 sendfile.cf -D ${pkgdir}/etc/sendfile.cf

install sfconf -D ${pkgdir}/usr/bin/sfconf
install sfdconf -D ${pkgdir}/usr/bin/sfdconf

cd ${srcdir}/${pkgname}-${pkgver}/doc
install -m644 sendmsg.1 -D ${pkgdir}/usr/share/man/man1/sendmsg.1
install -m644 sendfile.1 -D ${pkgdir}/usr/share/man/man1/sendfile.1
install -m644 receive.1 -D ${pkgdir}/usr/share/man/man1/receive.1
install -m644 fetchfile.1 -D ${pkgdir}/usr/share/man/man1/fetchfile.1
}

