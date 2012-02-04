pkgname=bmap
pkgver=1.0.17
pkgrel=1
pkgdesc="Bmap can store data in slackspace on any filesystem. It can detect used slackspace and recover the data."
url='http://www.securityfocus.com/tools/1359'
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('linuxdoc-tools')
source=("http://www.hacker-soft.net/tools/Miscellaneous/${pkgname}-${pkgver}.tar.gz")
md5sums=('8b96a7f41b2de1a076dd4c00f32daee0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's|BINDIR = "[^"]*"|BINDIR = $(DESTDIR)/usr/bin|;
          s|MANDIR = "[^"]*"|MANDIR = $(DESTDIR)/usr/share/man|' Makefile
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -m 755 -d "${pkgdir}/usr/bin" "${pkgdir}/usr/share/man/man1"
  make DESTDIR="${pkgdir}" install
}
