# Maintainer: Felipe Morales <hel.sheep@gmail.com>
# Contributor: graysky <graysky AT archlinux DOT us>
pkgname=devede-git
_pkgname=Devede
pkgver=v3.23.0.4.g757d20a
pkgrel=1
pkgdesc="A program to create VideoDVDs and CDs"
arch=('any')
url="http://www.rastersoft.com/programas/devede.html"
license=('GPL3')
depends=('mplayer' 'dvdauthor' 'vcdimager' 'cdrkit' 'pygtk' 'ttf-dejavu' 'mencoder' 'dbus-python')
makedepends=('git' 'findutils')
conflicts=('devede')
provides=('devede')
source=('git://github.com/rastersoft/Devede.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  find "$_pkgname" -type f -executable | xargs sed -i '/^#!\/usr\/bin\/env/ s,python,python2,'
}

package() {
  cd "$_pkgname"

  ./install.sh --DESTDIR="$pkgdir" --prefix=/usr --unistall=no --targeted=yes

  install -Dm644 devede.desktop "$pkgdir"/usr/share/applications/devede.desktop
}
