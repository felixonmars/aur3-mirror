
pkgname=musicdog
pkgver=2.2.1
license='?'
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Music streaming media player."
url=('http://www.musicdog.se/')
source=(http://www.musicdog.se/downloads/MusicDog_Installer.air ${pkgname}.desktop)
depends=('adobe-air')
makedepends=('unzip')
md5sums=('c5902861ff616ddc24a6e119292f228c'
         '5939d05459f32a86980b0c00ce820e26')

build() {
  mkdir -p ${pkgdir}/opt/airapps/
  mkdir -p ${pkgdir}/usr/bin/
  cd $srcdir
  unzip MusicDog_Installer.air -d ${pkgdir}/opt/airapps/${pkgname}
  touch $pkgdir/usr/bin/${pkgname}
  echo "#!/bin/bash" >> $pkgdir/usr/bin/${pkgname}
  echo "/opt/adobe-air-sdk/bin/adl -nodebug /opt/airapps/${pkgname}/META-INF/AIR/application.xml /opt/airapps/${pkgname}/" >> $pkgdir/usr/bin/${pkgname}
  chmod +x $pkgdir/usr/bin/${pkgname}
  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
} 
