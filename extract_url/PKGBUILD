# Maintainer: Byron Clark <byron@theclarkfamily.name>
pkgname=extract_url
pkgver=1.5.8
pkgrel=1
pkgdesc="A Perl script that extracts URLs from correctly-encoded MIME email messages"
arch=('any')
url='https://code.google.com/p/extracturl/'
license=('BSD')
depends=('perl>=5.10.0' 'perl-mime-tools' 'perl-html-parser')
optdepends=('perl-curses-ui: curses interface'
            'perl-uri-find: enhanced uri extraction')
source=("https://extracturl.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('579b4504ba4c89ca6331af89ba40f827')

build() {
  cd "${srcdir}/${pkgname}"
  make
}
  
package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
