# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=javafx-scene-builder
_major=2.0
_build=b20
pkgver=$_major$_build
pkgrel=1
pkgdesc="A visual layout tool that lets users quickly design JavaFX application user interfaces, without coding."
arch=('i686' 'x86_64')
url="http://www.oracle.com/technetwork/java/javase/downloads/javafxscenebuilder-info-2157684.html"
license=('custom')
depends=('java-environment>=8')
provides=('javafx-scene-builder')
replaces=('javafx-scene-builder-devel')

md5sums=('22d82b3ea93a52f988b92b76a73ed83a'
         '2418cfea62849bee8db1c02962ae2705'
         'ea92247d9cb86358e2de880ef09f1428'
         '374fdcfa8037bccd2e189f78a2b2322d')

_arch="x64"
if [ "${CARCH}" != "x86_64" ]; then
  _arch="i586"
  md5sums[0]="b2ff8cd3d553fa3a0fe2746264c72734"
fi

source=("http://download.oracle.com/otn-pub/java/javafx_scenebuilder/${_major}-${_build}/javafx_scenebuilder-${_major/./_}-linux-${_arch}.tar.gz"
        'javafx-scene-builder.desktop'
        'javafx-scene-builder.png'
        'LICENSE')

DLAGENTS=('http::/usr/bin/curl -LC - -b "oraclelicense=a" -O')

package() {
  install -d "${pkgdir}"/opt
  cp -r JavaFXSceneBuilder${_major} "${pkgdir}"/opt/JavaFXSceneBuilder

  install -D -m644 "${srcdir}"/javafx-scene-builder.desktop \
    "${pkgdir}"/usr/share/applications/javafx-scene-builder.desktop
  install -D -m644 "${srcdir}"/javafx-scene-builder.png \
    "${pkgdir}"/usr/share/pixmaps/javafx-scene-builder.png

  install -d "${pkgdir}"/usr/bin
  ln -s /opt/JavaFXSceneBuilder/JavaFXSceneBuilder${_major} \
    "${pkgdir}/usr/bin/JavaFXSceneBuilder"

  install -d "${pkgdir}"/usr/share/licenses/${pkgname}
  install "${srcdir}"/LICENSE \
    "${pkgdir}"/usr/share/licenses/${pkgname}
}
