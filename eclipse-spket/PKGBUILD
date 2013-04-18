# Contributor: Vasily Ryabov <me@ryvasy.net>
pkgname="eclipse-spket"
pkgver="1.6.23"
pkgrel="1"
pkgdesc="Spket IDE is powerful toolkit for JavaScript and XML development."
url="http://spket.com/"
license=('Eclipse public license')
arch=('i686' 'x86_64')
depends=('eclipse>=3.2')
source=("http://www.agpad.com/downloads/spket-${pkgver}.zip")
md5sums=('412177d4af8af5bc5c224121b783cfe4')

package() {
	mkdir -p ${startdir}/pkg/usr/share/eclipse/
	cp -R ${startdir}/src/eclipse ${startdir}/pkg/usr/share/
}
