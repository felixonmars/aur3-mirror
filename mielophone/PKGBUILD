
pkgname=mielophone
pkgver=0.2.3
license='GPLv3'
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A minimalistic application for searching, listening, downloading and discovering new music"
url=('http://mielophone.github.com')
source=(https://github.com/downloads/mielophone/Mielophone/Mielophone_generic_v${pkgver}.air ${pkgname}.desktop)
depends=('adobe-air')
md5sums=('27a4af3f91039ac266241e6dd00c5778'
         '2d54e795f0cca3ecdef707bc33fd681e')

build() {
  mkdir -p ${pkgdir}/opt/airapps/
  mkdir -p ${pkgdir}/usr/bin/
  cd $srcdir
  unzip Mielophone_generic_v${pkgver}.air -d ${pkgdir}/opt/airapps/${pkgname}
  touch $pkgdir/usr/bin/${pkgname}
  echo "#!/bin/bash" >> $pkgdir/usr/bin/${pkgname}
  echo "/opt/adobe-air-sdk/bin/adl -nodebug /opt/airapps/${pkgname}/META-INF/AIR/application.xml /opt/airapps/${pkgname}/" >> $pkgdir/usr/bin/${pkgname}
  chmod +x $pkgdir/usr/bin/${pkgname}
  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
} 
