# Maintainer: Lukas Gierth <lukas.gierth@mailbox.org>
# Contributer: Jeremiah Dodds <jeremiah.dodds@gmail.com>

pkgname=mkd2pdf
pkgver=1.1
pkgrel=4
pkgdesc="Convert markdown to pdf"
arch=('any')
url="http://github.com/jdodds/mkd2pdf"
license=('custom:WTFPL')
depends=(python-markdown wkhtmltopdf markdown)
source=("https://github.com/jdodds/mkd2pdf/raw/v1.1/"{mkd2pdf,LICENSE})
sha256sums=('10701853f2c9de0d7ab12d1734715ddeef3b769a78a88eeef2b8f77f92171893' '800d64ec414f96eb52c15d64dbd72c2edae1ad0182a6068c569b8b4ec5e42ef3')
package() {
	  install -Dm755 mkd2pdf "$pkgdir/usr/bin/mkd2pdf"
	  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/mkd2pdf/COPYING"
}
