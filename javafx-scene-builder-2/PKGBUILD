# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=javafx-scene-builder-2
_major=2.0
_build=b20
pkgver=$_major$_build
pkgrel=2
pkgdesc="A visual layout tool that lets users quickly design JavaFX application user interfaces, without coding."
arch=('i686' 'x86_64')
url="http://www.oracle.com/technetwork/java/javase/downloads/javafxscenebuilder-info-2157684.html"
license=('custom')
depends=('java-environment>=8')
provides=('javafx-scene-builder-2')
conflicts=('javafx-scene-builder-2')

md5sums=('22d82b3ea93a52f988b92b76a73ed83a'
         '28ffe2846ae76741db2fe4a949f6be36'
         'ea92247d9cb86358e2de880ef09f1428'
         '77fdff7f47a3ba51e138280c4cdc8c33')

_arch="x64"
if [ "${CARCH}" != "x86_64" ]; then
  _arch="i586"
  md5sums[0]="b2ff8cd3d553fa3a0fe2746264c72734"
fi

source=("http://download.oracle.com/otn-pub/java/javafx_scenebuilder/${_major}-${_build}/javafx_scenebuilder-${_major/./_}-linux-${_arch}.tar.gz"
        'javafx-scene-builder-2.desktop'
        'javafx-scene-builder-2.png'
        'LICENSE')

DLAGENTS=('http::/usr/bin/curl -LC - -b "oraclelicense=a" -O')

package() {
  install -d "${pkgdir}"/opt
  cp -r JavaFXSceneBuilder${_major} "${pkgdir}"/opt/JavaFXSceneBuilder${_major}

  install -D -m644 "${srcdir}"/javafx-scene-builder-2.desktop \
    "${pkgdir}"/usr/share/applications/javafx-scene-builder-2.desktop
  install -D -m644 "${srcdir}"/javafx-scene-builder-2.png \
    "${pkgdir}"/usr/share/pixmaps/javafx-scene-builder-2.png

  install -d "${pkgdir}"/usr/bin
  ln -s /opt/JavaFXSceneBuilder${_major}/JavaFXSceneBuilder${_major} \
    "${pkgdir}/usr/bin/JavaFXSceneBuilder2"

  install -d "${pkgdir}"/usr/share/licenses/${pkgname}
  install "${srcdir}"/LICENSE \
    "${pkgdir}"/usr/share/licenses/${pkgname}
}
