# Maintainer: Robert Charlton <rectec@mail.com>

pkgname=tor-stable
pkgver=0.2.4.19
pkgrel=1
pkgdesc='Anonymizing overlay network. (Latest stable release)'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://www.torproject.org/'
license=('BSD')
depends=('openssl' 'libevent' 'bash')
optdepends=('torsocks: For torify')
makedepends=('ca-certificates')
conflicts=(tor)
provides=(tor)
backup=('etc/tor/torrc'
        'etc/tor/torrc-dist'
        'etc/tor/tor-tsocks.conf')
install='tor.install'
source=("https://www.torproject.org/dist/tor-${pkgver/_/-}.tar.gz"{,.asc}
        'torrc'
        'tor.service')
md5sums=('5fb5d7252b60859428083e34dde46421'
         'SKIP'
	 'c1dd4004c63edaeaa829e01be5413cfc'
         'a396657e6f6df21d319ad586500c04b1')

build() {
  cd "${srcdir}/tor-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "${srcdir}/tor-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -dm0700 "${pkgdir}/var/lib/tor"

  mv "${pkgdir}/etc/tor/torrc.sample" "${pkgdir}/etc/tor/torrc-dist"
  install -Dm0644 "${srcdir}/torrc" "${pkgdir}/etc/tor/torrc"

  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm0644 "${srcdir}/tor.service" "${pkgdir}/usr/lib/systemd/system/tor.service"
}
