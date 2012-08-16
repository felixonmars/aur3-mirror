# Contributor: Tomas Kopecny aka Georgo10 <georgo10@gmail.com>
# Contributor: scorpfa
# Contributor: fi-dschi <fi-dschi_archlinux - at - arcor - dot - de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mucommander
pkgver=0.9.0
_versfx=`echo ${pkgver} | tr . _`
pkgrel=2
pkgdesc="A lightweight file manager written in Java"
url="http://www.mucommander.com"
depends=('java-runtime' 'hicolor-icon-theme' 'sh')
makedepends=('java-environment')
arch=('any')
source=(${url}/download/${pkgname}-${_versfx}.tar.gz
	$pkgname.desktop $pkgname.sh)
md5sums=('934f48cefb74da275cfa1f49a4ffb2d5'
         '0794481b8c2efb396ecbb40c830b72cf'
         '5a9e65d0b3e3c2eac9fdf653bfefc15f')
license=('GPL')
install=$pkgname.install

package() {
  cd ${srcdir}/muCommander-${_versfx}
  jar xf $pkgname.jar

  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/$pkgname
  install -d ${pkgdir}/usr/share/applications
  install -d \
    ${pkgdir}/usr/share/icons/hicolor/{256x256,128x128,48x48,32x32,16x16}/apps
  install -d ${pkgdir}/usr/share/icons/locolor/{48x48,16x16}/apps
  
  install -Dm644 $pkgname.jar ${pkgdir}/usr/share/$pkgname/$pkgname.jar
  install -Dm644 readme.txt ${pkgdir}/usr/share/doc/$pkgname/readme.txt 

  cd images/$pkgname
  install -Dm644 icon256_24.png \
    ${pkgdir}/usr/share/icons/hicolor/256x256/apps/$pkgname.png
  install -Dm644 icon128_24.png \
    ${pkgdir}/usr/share/icons/hicolor/128x128/apps/$pkgname.png
  install -Dm644 icon48_24.png \
    ${pkgdir}/usr/share/icons/hicolor/48x48/apps/$pkgname.png
  install -Dm644 icon32_24.png \
    ${pkgdir}/usr/share/icons/hicolor/32x32/apps/$pkgname.png
  install -Dm644 icon16_24.png \
    ${pkgdir}/usr/share/icons/hicolor/16x16/apps/$pkgname.png
  install -Dm644 icon48_8.png \
    ${pkgdir}/usr/share/icons/locolor/48x48/apps/$pkgname.png
  install -Dm644 icon16_8.png \
    ${pkgdir}/usr/share/icons/locolor/16x16/apps/$pkgname.png

  install -Dm755 $srcdir/$pkgname.sh ${pkgdir}/usr/bin/$pkgname 
  install -Dm644 $srcdir/$pkgname.desktop \
    ${pkgdir}/usr/share/applications/$pkgname.desktop
}
