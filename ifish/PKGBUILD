# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=ifish
pkgver=1.4
pkgrel=3
pkgdesc="Database generator for the iRiver H (aka iHP) series harddisk jukeboxes."
arch=('i686' 'x86_64')
url="http://www.shredzone.de/projects/ifish"
license=('MPL')
depends=('java-runtime' 'desktop-file-utils')
install=$pkgname.install
source=(http://www.shredzone.de/download/java/$pkgname/iFish.jar \
        http://www.shredzone.de/download/java/$pkgname/${pkgname}_en.pdf \
        $pkgname.png \
        $pkgname.desktop)

md5sums=('a5c05ea0df3bc3c405f88c19a0ea8593'
         'b0ca0fed446d422052c47fbd863e7d9f'
         'a4b8a648e8f565d6fe916a4d4701c7e0'
         'e908637ec8eab5a84b547ef5e800e020')

build() {
  cd "${srcdir}"

  install -D -m644 "${srcdir}/iFish.jar" "${pkgdir}/usr/share/java/$pkgname/$pkgname.jar" || return 1
  install -D -m644 "${srcdir}/${pkgname}_en.pdf" "${pkgdir}/usr/share/java/$pkgname/help/${pkgname}_en.pdf" || return 1
  install -D -m644 "${srcdir}/$pkgname.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png" || return 1
  install -D -m644 "${srcdir}/$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop" || return 1

  install -d "${pkgdir}/usr/bin"
  echo "#!/bin/bash" > "${pkgdir}/usr/bin/$pkgname" || return 1
  echo "java -jar /usr/share/java/$pkgname/$pkgname.jar" >> "${pkgdir}/usr/bin/$pkgname" || return 1
  chmod 755 "${pkgdir}/usr/bin/$pkgname" || return 1
}
