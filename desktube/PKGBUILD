# Contributor: Adam Russ <mail@russ.co.il>
# Contributor: Wido <widomaker2k7àgmail.com>

pkgname=desktube
pkgver=1.0
pkgrel=3
pkgdesc="Standalone Adobe Air Application for Youtube"
arch=('i686' 'x86_64')
url="http://thedesktube.com/"
license=('custom')
depends=('adobe-air')
makedepends=('unzip')
source=('http://thedesktube.com/DeskTube.air'
	'desktube.desktop')

build()
{
   cd ${startdir}/src
   mkdir -p ${startdir}/pkg/opt/desktube
   
   unzip DeskTube.air -d ${startdir}/src

   install -m644 -D ${startdir}/src/icons/icon_128.png ${startdir}/pkg/usr/share/pixmaps/desktube.png
   install -m644 -D ${startdir}/src/DeskTube.air ${startdir}/pkg/opt/desktube
   install -m644 -D ${startdir}/src/desktube.desktop ${startdir}/pkg/usr/share/applications/desktube.desktop
}
md5sums=('88804845e5cfe2061af7defa8fca0cc1'
         '90e077a0a7f2e9f7d39b54723ed42bb6')
