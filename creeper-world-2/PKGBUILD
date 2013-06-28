# Maintainer:  Jesse Jaara      <jesse.jaara@gmail.com>

pkgname=creeper-world-2
pkgver=0244
pkgrel=2
pkgdesc="The creeps are coming! You'll need to get off this planet, but you'll have to fight your way out."
arch=('i686' 'x86_64')
url="http://knucklecracker.com/creeperworld2/cw2.php"
license=('custom')
depends=('adobe-air-sdk')
makedepends=('unzip')
source=(http://knucklecracker.com/creeperworld2/patches/cw2PATCH-${pkgver}.air
	creeper.desktop)
noextract=(cw2PATCH-${pkgver}.air)

package() {
  cd "${srcdir}"

  unzip cw2PATCH-${pkgver}.air

  mkdir -p "${pkgdir}"/usr/share/{cw2,applications}
  mkdir -p "${pkgdir}/usr/bin"

  cp -r icons  Main.swf META-INF  mimetype "${pkgdir}/usr/share/cw2/"

  cp -p creeper.desktop "${pkgdir}/usr/share/applications/"
  cat <<EOF >> "${pkgdir}/usr/bin/cw2"
#!/bin/sh
/opt/adobe-air-sdk/bin/adl -nodebug /usr/share/cw2/META-INF/AIR/application.xml /usr/share/cw2 &
EOF

  chmod +x "${pkgdir}/usr/bin/cw2"
}

md5sums=('3d77db0d930a3cacf4ad4b88d7c26003'
         '331d38e2c450b3e213727c659c4e88e5')
