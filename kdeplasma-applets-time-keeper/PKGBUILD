# Maintainer: hbdee <hbdee.arch@gmail.com>

pkgname=kdeplasma-applets-time-keeper
_pname=timekeeper
pkgver=0.5.1
pkgrel=1
pkgdesc="This plasmoid provides a clock and a calendar function via steampunk interface."
arch=('any')
url="http://kde-apps.org/content/show.php?content=159345"
license=('GPL')
depends=('kdebase-workspace' 'kdeedu-marble')
makedepends=('unzip')
conflicts=('kdeplasma-applet-time-keeper')
source=("http://kde-apps.org/CONTENT/content-files/159345-${_pname}.plasmoid")
md5sums=('b4686601eb5e640e5fe012ff7110fa73')

prepare() {
  unzip -o -q "${srcdir}/159345-${_pname}.plasmoid" -d "${srcdir}/${_pname}-${pkgver}"
}

package() {
  cd ${srcdir}/${_pname}-${pkgver}
  sed -i 's;icon.png;timekeeper.png;g' metadata.desktop
  install -Dm644 metadata.desktop ${pkgdir}/`kde4-config --prefix`/share/kde4/services/plasma-applet-timekeeper.desktop
  install -Dm644 icon.png $pkgdir/`kde4-config --prefix`/share/pixmaps/${_pname}.png
  mkdir -p ${pkgdir}/`kde4-config --prefix`/share/apps/plasma/plasmoids/${_pname}/contents/{calendar,clock/{back,wheels},config,luna,otherside,terra,timekeeper}
  install -Dm644 metadata.desktop ${pkgdir}/`kde4-config --prefix`/share/apps/plasma/plasmoids/${_pname}/metadata.desktop
  install -Dm644 contents/main.qml ${pkgdir}/`kde4-config --prefix`/share/apps/plasma/plasmoids/${_pname}/contents/main.qml
  install -Dm644 contents/calendar/* ${pkgdir}/`kde4-config --prefix`/share/apps/plasma/plasmoids/${_pname}/contents/calendar
  install -Dm644 contents/clock/{*.png,Clock.qml,Engravers_MT.ttf} ${pkgdir}/`kde4-config --prefix`/share/apps/plasma/plasmoids/${_pname}/contents/clock
  install -Dm644 contents/clock/back/* ${pkgdir}/`kde4-config --prefix`/share/apps/plasma/plasmoids/${_pname}/contents/clock/back
  install -Dm644 contents/clock/wheels/* ${pkgdir}/`kde4-config --prefix`/share/apps/plasma/plasmoids/${_pname}/contents/clock/wheels
  install -Dm644 contents/config/* ${pkgdir}/`kde4-config --prefix`/share/apps/plasma/plasmoids/${_pname}/contents/config
  install -Dm644 contents/luna/* ${pkgdir}/`kde4-config --prefix`/share/apps/plasma/plasmoids/${_pname}/contents/luna
  install -Dm644 contents/otherside/* ${pkgdir}/`kde4-config --prefix`/share/apps/plasma/plasmoids/${_pname}/contents/otherside
  install -Dm644 contents/terra/* ${pkgdir}/`kde4-config --prefix`/share/apps/plasma/plasmoids/${_pname}/contents/terra
  install -Dm644 contents/timekeeper/* ${pkgdir}/`kde4-config --prefix`/share/apps/plasma/plasmoids/${_pname}/contents/timekeeper
}
 
