# Maintainer: Martin F. Schumann <mfs@mfs.name>
pkgname=unvanquished-maps
pkgver=20120603
pkgrel=1
pkgdesc="The maps package for unvanquished"
arch=('i686' 'x86_64')
url="http://www.unvanquished.net"
license=('GPL3')
groups=()
depends=('unvanquished-git>=20120603-2')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=('http://downloads.sourceforge.net/project/unvanquished/Map%20Pack/maps.7z' 'http://downloads.sourceforge.net/project/unvanquished/Map%20Pack/navmesh-default-0.1.pk3')
noextract=('navmesh-default-0.1.pk3')
md5sums=('f0b57874a0fe67e52188666eee9faded'
         '6b1861f3237f07255047e49c9ea75cd2')

package() {

  cd "$srcdir"
  install -d "$pkgdir"/opt/unvanquished/main
  install *.pk3 "$pkgdir"/opt/unvanquished/main/
}

# vim:set ts=2 sw=2 et:
