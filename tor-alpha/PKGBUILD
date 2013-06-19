# Maintainer: narve <narve at hush dot ai>

pkgname=tor-alpha
pkgver=0.2.4.14
pkgrel=2
pkgdesc='Anonymizing overlay network in its alpha version'
arch=('i686' 'x86_64')
url='http://www.torproject.org/'
license=('BSD')
depends=('openssl' 'libevent' 'torsocks' 'bash')
makedepends=('ca-certificates')
backup=('etc/tor/torrc'
        'etc/tor/torrc-dist'
        'etc/tor/tor-tsocks.conf')
install='tor.install'
provides='tor'
conflicts='tor'
source=("http://www.torproject.org/dist/tor-${pkgver}-alpha.tar.gz"{,.asc}
        'torrc'
        'tor.service')
md5sums=('c8dc363b82e870ccff20a787fea8f0c9'
	'SKIP'
	'c1dd4004c63edaeaa829e01be5413cfc'
	'a396657e6f6df21d319ad586500c04b1')

build() {
  cd "${srcdir}/tor-${pkgver}-alpha"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "${srcdir}/tor-${pkgver}-alpha"

  make DESTDIR="${pkgdir}" install

  install -dm0700 "${pkgdir}/var/lib/tor"

  mv "${pkgdir}/etc/tor/torrc.sample" "${pkgdir}/etc/tor/torrc-dist"
  install -Dm0644 "${srcdir}/torrc" "${pkgdir}/etc/tor/torrc"

  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm0644 "${srcdir}/tor.service" "${pkgdir}/usr/lib/systemd/system/tor.service"
}
