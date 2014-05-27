# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=javafx-scene-builder-1
_major=1.1
_build=b35
pkgver=$_major$_build
pkgrel=1
pkgdesc="A visual layout tool that lets users quickly design JavaFX application user interfaces, without coding."
arch=('i686' 'x86_64')
url="http://www.oracle.com/technetwork/java/javase/downloads/javafxscenebuilder-info-2157684.html"
license=('custom')
depends=('java-environment>=7')
provides=('javafx-scene-builder-1')
conflicts=('javafx-scene-builder-1')

md5sums=('c0d252afaab6da64115bc7e6e1133c8c'
         'a3fdd28ae5cb5e8265f3c4fc28da6ee3'
         'ea92247d9cb86358e2de880ef09f1428'
         '436b7647031e4c15c3a1a1beb9e8c0df')

_arch="x64"
if [ "${CARCH}" != "x86_64" ]; then
  _arch="i586"
  md5sums[0]="dbbb44941c02d5e44b15b6711cd5df3e"
fi

source=("http://download.oracle.com/otn-pub/java/javafx_scenebuilder/${_major}-${_build}/javafx_scenebuilder-${_major/./_}-linux-${_arch}.tar.gz"
        'javafx-scene-builder-1.desktop'
        'javafx-scene-builder-1.png'
        'LICENSE')

DLAGENTS=('http::/usr/bin/curl -LC - -b "oraclelicense=a" -O')

package() {
  install -d "${pkgdir}"/opt
  cp -r JavaFXSceneBuilder${_major} "${pkgdir}"/opt/JavaFXSceneBuilder${_major}

  install -D -m644 "${srcdir}"/javafx-scene-builder-1.desktop \
    "${pkgdir}"/usr/share/applications/javafx-scene-builder-1.desktop
  install -D -m644 "${srcdir}"/javafx-scene-builder-1.png \
    "${pkgdir}"/usr/share/pixmaps/javafx-scene-builder-1.png

  install -d "${pkgdir}"/usr/bin
  ln -s /opt/JavaFXSceneBuilder${_major}/JavaFXSceneBuilder${_major} \
    "${pkgdir}/usr/bin/JavaFXSceneBuilder1"

  install -d "${pkgdir}"/usr/share/licenses/${pkgname}
  install "${srcdir}"/LICENSE \
    "${pkgdir}"/usr/share/licenses/${pkgname}
}
