# Maintainer: Tom Debruyne <tomdebruyne at gmail dot com>

pkgname=kdeplasma-addons-applets-veromix
pkgver=0.18.3
pkgrel=1
pkgdesc="A plasmoid mixer for the Pulseaudio sound server"
url="http://code.google.com/p/veromix-plasmoid/"
license=('GPL3')
arch=('any')
depends=('kdebindings-python' 'kdebase-workspace' 'pyqt' 'pulseaudio' 'pyxdg')
optdepends=('swh-plugins: equalizer and other effects support')
makedepends=()

source=(http://veromix-plasmoid.googlecode.com/files/2012-06-14_${pkgver}_veromix.plasmoid)
sha1sums=('b923d3f1e16def498050c15a33c410d809d91195')
build() {
  cd $srcdir

  install -dm755 ${pkgdir}/usr/share/apps/plasma/plasmoids/veromix-plasmoid || return 1
  cp -R {contents,dbus-service,metadata.desktop} ${pkgdir}/usr/share/apps/plasma/plasmoids/veromix-plasmoid || return 1
  install -Dm644 metadata.desktop ${pkgdir}/usr/share/kde4/services/plasma-applet-veromix-plasmoid.desktop || return 1
  cd ${pkgdir}/usr/share/apps/plasma/plasmoids/veromix-plasmoid
#  patch -Np0 -i "${srcdir}/preset.patch" || return 1
#  sed -i -e '1 s/python/python2/' ${pkgdir}/usr/share/apps/plasma/plasmoids/veromix-plasmoid/dbus-service/veromix-service-qt.py
#  python2 -m compileall .
# add ladspa library path to ld.so.conf
#  install -d $pkgdir/etc/ld.so.conf.d
#  echo "/usr/lib/ladspa" > $pkgdir/etc/ld.so.conf.d/ladspa.conf
}
