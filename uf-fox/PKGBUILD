# Contributor: robb_force <robb_force@holybuffalo.net>
pkgname=uf-fox
_pkgname=uf-FOX
pkgver=1.1
pkgrel=1
pkgdesc="A frontend for the uCON64 rom backup and management tool."
url="http://ucon64.sourceforge.net/index.php"
arch=('i686' 'x86_64')
license="GPL"
depends=('ucon64' 'fox-legacy' 'fox')
source=(http://downloads.sourceforge.net/ucon64/${_pkgname}-${pkgver}-src.tgz \
  uf-fox.desktop \
  uf-fox.png)
md5sums=('13c7b4be64e644b44cbb2077d40f873f'
         'fbaf44e91653f5195efa514a77227618'
         '95e8e9902f65ce1747f418df1bfd3d0a')

build() {
  cd ${startdir}/src/${_pkgname}-${pkgver}-src

  # Modify the makefile to arch paths
  sed -e 's|/usr/local/include/fox-1.4|/usr/include/fox-1.4|' \
    -e 's|/usr/local/lib|/usr/lib|' \
    -i Makefile

  make || return 1

  # Install the application and the desktop entry
  install -D -m755 uf ${startdir}/pkg/usr/bin/uf
  install -Dm644 ${startdir}/src/${pkgname}.desktop ${startdir}/pkg//usr/share/applications/${pkgname}.desktop
  install -Dm644 ${startdir}/src/${pkgname}.png ${startdir}/pkg//usr/share/pixmaps/${pkgname}.png
}
