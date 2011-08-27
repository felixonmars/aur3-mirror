# Contributor: Lex Rivera aka x-demon <aur@x-demon.org>                
# Maintainer: Lex Rivera aka x-demon <aur@x-demon.org>

pkgname=kludget
pkgver=0.9.1
pkgrel=1
pkgdesc="Kludgets, widget engine"
depends=('qt')
source=("http://kludgets.googlecode.com/files/kludgets-${pkgver}.linux.tar.gz")
url="http://kludgets.googlecode.com"
options=("!strip")
md5sums=('3c4f34b586115cddb485d73c2777974e')
arch=('i686')
license=('custom')
build() {
  mkdir -p ${pkgdir}/opt/kludgets
	cp -r ${srcdir}/kludgets-${pkgver}.linux/* ${pkgdir}/opt/kludgets
}
