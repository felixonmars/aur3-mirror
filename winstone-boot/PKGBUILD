# Maintainer: Mildred Ki'Lya <mildred.fr>
pkgname=winstone-boot
pkgver=1.7.0
pkgrel=1
pkgdesc="Winstone is a servlet container that was written out of a desire to provide servlet functionality without the bloat that full J2EE compliance introduces."
url="https://github.com/geronimo-iia/winstone"
arch=('any')
license=('LGPL2.1')
depends=('java-runtime')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("http://central.maven.org/maven2/org/intelligents-ia/winstone/${pkgname}/${pkgver}/${pkgname}-${pkgver}.jar"
        "winstone-boot.sh")
noextract=('${pkgname}-${pkgver}.jar')
md5sums=('9ddcffb6158cee6278f797076c644560'
         '2208e0d7ce3a43e86da8d958f9ff868f')

build() {
  sed "s:%PREFIX%:/usr:" <"${srcdir}/winstone-boot.sh" >"${srcdir}/winstone-boot"
}

package() {
  install -m755 -d "$pkgdir/usr/share/winstone" "$pkgdir/usr/bin"
  install -m644 "${srcdir}/${pkgname}-${pkgver}.jar" "$pkgdir/usr/share/winstone/${pkgname}.jar"
  install -m755 "${srcdir}/winstone-boot" "$pkgdir/usr/bin/winstone-boot"
}

# vim:set ts=2 sw=2 et: