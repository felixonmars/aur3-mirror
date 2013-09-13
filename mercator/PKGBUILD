# Maintainer:	Jesse	 Jaara		<gmail.com: jesse.jaara>
# Contributor:	Jaroslav Lichtblau	<aur.archlinux.org: dragonlord>
# Contributor:	Mildred			<online.fr: silkensedai>

pkgname=mercator
pkgver=0.3.3
pkgrel=1
pkgdesc="WorldForge procedural terrain library"
arch=('i686' 'x86_64')
url="http://worldforge.org/dev/eng/libraries/mercator"
license=('GPL2')
depends=('wfmath')
source=(http://downloads.sourceforge.net/sourceforge/worldforge/${pkgname}-${pkgver}.tar.bz2)
options=(!libtool)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package () {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

md5sums=('fd7fbf4d59bd631e3b2185b70df145d1')
