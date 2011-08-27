# Contributor: Lex Rivera aka x-demon <aur@x-demon.org>                
# Maintainer: Lex Rivera aka x-demon <aur@x-demon.org>

pkgname=kludgets
pkgver=0.9.1
pkgrel=1
pkgdesc="Kludgets, widget engine"
depends=('qt')
source=("http://kludgets.googlecode.com/files/kludgets-${pkgver}.linux.tar.gz"
				"kludgets.desktop")
url="http://kludgets.googlecode.com"
options=("!strip")
md5sums=('3c4f34b586115cddb485d73c2777974e'
         '74586104a7d4524bf55781c4b5181e35')
arch=('i686')
license=('custom')
build() {
  mkdir -p ${pkgdir}/opt/kludgets
	mkdir -p ${pkgdir}/usr/share/applications/
	cp -r ${srcdir}/kludgets-${pkgver}.linux/* ${pkgdir}/opt/kludgets
	install -Dm644 ${srcdir}/kludgets.desktop ${pkgdir}/usr/share/applications/
}
