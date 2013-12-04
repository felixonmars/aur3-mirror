# Maintainer: Robert Charlton <rectec@mail.com>

pkgname=tor-rc
pkgver=0.2.4.18_rc
pkgrel=1
pkgdesc='Anonymizing overlay network. (Latest release candidate)'
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
md5sums=('6cc5bc776e9d61a9fb1b000609ed2692'
         'SKIP'
	 'c1dd4004c63edaeaa829e01be5413cfc'
         'a396657e6f6df21d319ad586500c04b1')

build() {
  cd "${srcdir}/${pkgname/-rc/}-${pkgver/_/-}"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "${srcdir}/${pkgname/-rc/}-${pkgver/_/-}"

  make DESTDIR="${pkgdir}" install

  install -dm0700 "${pkgdir}/var/lib/tor"

  mv "${pkgdir}/etc/tor/torrc.sample" "${pkgdir}/etc/tor/torrc-dist"
  install -Dm0644 "${srcdir}/torrc" "${pkgdir}/etc/tor/torrc"

  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm0644 "${srcdir}/tor.service" "${pkgdir}/usr/lib/systemd/system/tor.service"
}
