# Contributor: Andreqa Scarpino <andrea@archlinux.org>

pkgname=javafx-scene-builder-dev
_ver=2.0
_buildnum=b09
_date=19_dec_2013
pkgver=${_ver}${_buildnum}
pkgrel=1
pkgdesc="A visual layout tool that lets users quickly design JavaFX application user interfaces, without coding."
arch=('i686' 'x86_64')
url="http://www.oracle.com/technetwork/java/javafx/tools/index.html"
license=('custom')
depends=('jdk>=8')
provides=('javafx-scene-builder')
conflicts=('javafx-scene-builder')
_arch="x64"
if [ "${CARCH}" = "i686" ]; then
  _arch="i586"
  md5sums[0]="c45b75568baa8c39bba63778446c7334"
fi
source=("http://download.oracle.com/otn-pub/java/javafx_scenebuilder/${_ver}-ea-${_buildnum}/javafx_scenebuilder-${_ver/./_}-ea-${_buildnum}-linux-${_arch}-${_date}.tar.gz"
        'javafx-scene-builder.desktop'
        'javafx-scene-builder.png'
        'LICENSE')
md5sums=('dd853831e803595ce38b0e9033fd492a'
         '2418cfea62849bee8db1c02962ae2705'
         'ea92247d9cb86358e2de880ef09f1428'
         '374fdcfa8037bccd2e189f78a2b2322d')

DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -O --header "Cookie: gpw_e24=h"')

package() {
  install -d "${pkgdir}"/opt
  cp -r JavaFXSceneBuilder${_ver} "${pkgdir}"/opt/JavaFXSceneBuilder

  install -D -m644 "${srcdir}"/javafx-scene-builder.desktop \
    "${pkgdir}"/usr/share/applications/javafx-scene-builder.desktop
  install -D -m644 "${srcdir}"/javafx-scene-builder.png \
    "${pkgdir}"/usr/share/pixmaps/javafx-scene-builder.png

  install -d "${pkgdir}"/usr/bin
  ln -s /opt/JavaFXSceneBuilder/JavaFXSceneBuilder${_ver} \
    "${pkgdir}/usr/bin/JavaFXSceneBuilder"

  install -d "${pkgdir}"/usr/share/licenses/${pkgname}
  install "${srcdir}"/LICENSE \
    "${pkgdir}"/usr/share/licenses/${pkgname}
}
