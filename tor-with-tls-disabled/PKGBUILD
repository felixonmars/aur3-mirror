# Maintainer: Keyvan Hedayati <k1.hedayati93@gmail.com>
# Because torproject.org is not accessible from Iran
# I have mirrored it to my Ubuntu One but if you don't
# TRUST me you can download source code from here:
# https://www.torproject.org/dist/tor-0.2.4.20.tar.gz
# and replace it with inculded archive, also don't
# forget to recalculate md5sum of archive, but I don't
# think you need to do that ;)

pkgname=tor-with-tls-disabled
pkgver=0.2.4.20
pkgrel=1
pkgdesc='Anonymizing overlay network. (TLS Disabled, see PKGBUILD before installing)'
arch=('i686' 'x86_64' 'armv7h')
url='http://www.torproject.org/'
license=('BSD')
depends=('openssl' 'libevent' 'bash')
optdepends=('torsocks: for torify')
makedepends=('ca-certificates')
conflicts=(tor)
provides=(tor=0.2.4.20)
backup=('etc/tor/torrc')
install='tor.install'
source=('http://ubuntuone.com/3enE8oz9JAzFNXyCrHGKzn'
        'torrc'
        'tor.service'
        '0001-TLS-Disabled.patch')
md5sums=('a8cd8e3b3a3f6a7770f2c22d280f19b8'
         'c1dd4004c63edaeaa829e01be5413cfc'
         'a396657e6f6df21d319ad586500c04b1'
         'cf2ffc608e339b99d8a53862eb28e1da')


prepare() {
  cd "${srcdir}/tor-${pkgver}"

  patch -Np1 <"$srcdir"/0001-TLS-Disabled.patch
}

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
