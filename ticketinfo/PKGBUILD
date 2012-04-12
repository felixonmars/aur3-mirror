# Maintainer: Heiko Baums <heiko@baums-on-web.de>

pkgname=ticketinfo
pkgver=1.8.01
pkgrel=2
pkgdesc="Read local public transport RFID tickets"
url="http://www.ticket-info.net"
license=('GPL')
arch=('any')
depends=('java-runtime' 'pcsclite')
source=(http://www.ticket-info.net/imperia/md/content/$pkgname/$pkgname.zip
        ticketinfo_start.sh
        ticketinfo.desktop)
md5sums=('4f0b9f6dfc76821d6ebdc04b1d9b3a9e'
         '53d6b001c14599b97014f8e2dfaefba3'
         '5717b0a96519539e4b44b1d5a3fb9c0a')

package() {
  cd "$srcdir/Aktuelle Version"
  install -d -m755 -o root -g root ${pkgdir}/opt/ticketinfo/{efm,lib}
  install -d -m755 -o root -g root ${pkgdir}/usr/{bin,share/applications}
  install -D -m644 -o root -g root Ticketinfo* ${pkgdir}/opt/ticketinfo
  install -D -m644 -o root -g root efm/* ${pkgdir}/opt/ticketinfo/efm
  install -D -m644 -o root -g root lib/* ${pkgdir}/opt/ticketinfo/lib
  install -D -m644 -o root -g root e-ticket[1].jpg ${pkgdir}/opt/ticketinfo/e-ticket.jpg
  install -D -m644 -o root -g root eTicket.ico ${pkgdir}/opt/ticketinfo
  cd "$srcdir"
  install -D -m755 -o root -g root ticketinfo_start.sh ${pkgdir}/usr/bin/ticketinfo
  install -D -m644 -o root -g root ticketinfo.desktop ${pkgdir}/usr/share/applications
}
