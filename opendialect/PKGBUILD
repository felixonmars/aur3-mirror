# Contributor: Jesus Jerez <jhuss@archlinux.com.ve>
pkgname="opendialect"
pkgver="0.6.0"
pkgrel="2"
pkgdesc="Open Dialect is an open source IDE for Flash distributed under the GPL"
url="http://dialect.openmodeling.net/"
license=('GPL' 'MPL')
arch=('i686' 'x86_64')
depends=('mono' 'gtk-sharp-2')
source=("http://dialect.openmodeling.net/downloads/9" "opendialect" "opendialect.desktop")
md5sums=('f1e05dd9dbefb043d80ef4675cd08ee9'
         '7a4492293d15d15bfcf19e18ca38e246'
         '942339bc3473f3db84cfaac016985ab0')

build() {
  mkdir -p ${startdir}/pkg/usr/share/
  cp -R ${startdir}/src/OpenDialect060 ${startdir}/pkg/usr/share/opendialect
  mkdir -p ${startdir}/pkg/usr/bin/
  cp ${startdir}/opendialect ${startdir}/pkg/usr/bin/opendialect
  chmod +x ${startdir}/pkg/usr/bin/opendialect
  mkdir -p ${startdir}/pkg/usr/share/pixmaps/
  cp ${startdir}/src/OpenDialect060/AppIcon.png ${startdir}/pkg/usr/share/pixmaps/opendialect.png
  mkdir -p ${startdir}/pkg/usr/share/applications/
  cp ${startdir}/opendialect.desktop ${startdir}/pkg/usr/share/applications/opendialect.desktop
}
