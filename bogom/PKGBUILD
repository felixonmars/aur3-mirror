# Maintainer: ushi <ushi+arch@honkgong.info>
pkgname=bogom
pkgver=1.9.2
pkgrel=1
pkgdesc="A simple sendmail milter to interface bogofilter."
arch=('x86_64' 'i686')
url='http://www.usebox.net/jjm/bogom/'
license=('GPL')
depends=('libmilter')
backup=('etc/bogom.conf')
install=bogom.install

source=("http://www.usebox.net/jjm/bogom/${pkgname}-${pkgver}.tar.gz"
        'bogom.service'
        'bogom.conf')

sha256sums=('5b020ccc995bafb494dc4c93c45bee883fccea95af7a8dbfed2bf45d0f7e20d3'
            'a902ca9055dc6ff4dcf5b8dc56d2ede7753b43dab764de7e26d44b6aedd520e4'
            'fab0c4f0093d0e7277c139d8e3473de5e79199323b73c4fa76130210fc714a91')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
  gzip 'bogom.8'
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0644 'COPYING'            "${pkgdir}/usr/share/licenses/bogom/COPYING"
  install -Dm0644 'bogom.8.gz'         "${pkgdir}/usr/share/man/man8/bogom.8.gz"
  install -Dm0644 'bogom.conf-example' "${pkgdir}/etc/bogom.conf"
  install -Dm0755 'bogom'              "${pkgdir}/usr/bin/bogom"

  sed -e 's/.*default: \(bogofilter\).*/\1 "\/usr\/bin\/bogofilter"/'        \
      -e 's/.*default: \(pidfile\).*/\1 "\/run\/bogom\/bogom.pid"/'          \
      -e 's/.*default: \(connection\).*/\1 "unix:\/run\/bogom\/bogom.sock"/' \
      -i "${pkgdir}/etc/bogom.conf"

  cd ..
  install -Dm0644 'bogom.service'      "${pkgdir}/usr/lib/systemd/system/bogom.service"
  install -Dm0644 'bogom.conf'         "${pkgdir}/usr/lib/tmpfiles.d/bogom.conf"
}
