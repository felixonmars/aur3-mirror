# Contributor:	Thomas Mudrunka <harvie@@email..cz>
# Maintainer: 	Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=jtux
pkgver=0.0.1
pkgrel=1
pkgdesc="2D action game (overhand shotgame), like Bulanci or Tuxanci."
arch=('any')
url="http://jtux.mgn.cz/"
license=('GPL')
depends=('java-runtime' 'desktop-file-utils')
source=(
	http://jtux.mgn.cz/download/JTUx.jar
	$pkgname.desktop
)
md5sums=('539a8cdc8c9f7316407a18dc3f9e6671'
         '48cc1b524cf491109d51c8ff239b588c')

build() {
  cd ${srcdir}/

  install -d ${pkgdir}/usr/share/java/$pkgname || return 1
  cp JTUx.jar ${pkgdir}/usr/share/java/$pkgname/JTux.jar || return 1

#.desktop + icon files
  install -D -m644 ${srcdir}/$pkgname.desktop \
    ${pkgdir}/usr/share/applications/$pkgname.desktop || return 1
  #install -D -m644 ${srcdir}/$pkgname-$pkgver/icons/$pkgname.png \
  #  ${pkgdir}/usr/share/pixmaps/$pkgname.png || return 1

#executable file
  install -d ${pkgdir}/usr/bin || return 1
	cat > ${pkgdir}/usr/bin/$pkgname << EOF
#!/bin/sh
java -jar /usr/share/java/$pkgname/JTux.jar
EOF

	chmod 775 ${pkgdir}/usr/bin/$pkgname
}
