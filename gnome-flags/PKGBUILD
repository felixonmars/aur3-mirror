# Contributor: Roman Timushev <romikt@gmail.com>
# Contributor: Dmitrij Czarkoff <czarkoff@gmail.com>
pkgname=gnome-flags
pkgver=0.5.4.1
pkgrel=1
pkgdesc="show flags in GNOME layout indicator"
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-xkb-plugin"
arch=('i686' 'x86_64')
license=('custom')
depends=(gnome-applets)
makedepends=(imagemagick)
changelog="ChangeLog"
install=gnome-flags.install
source=("http://archive.xfce.org/src/panel-plugins/xfce4-xkb-plugin/0.5/xfce4-xkb-plugin-${pkgver}.tar.bz2")
md5sums=('8512c0b180004e1150d8c05255c202d8')

build() {
  mkdir -p ${pkgdir}/usr/share/icons/flags/
  cd ${srcdir}/xfce4-xkb-plugin-$pkgver/flags/
  for i in *.svg
  do
    convert $i -scale 60x45\! ${pkgdir}/usr/share/icons/flags/$(echo $i | cut -d \. -f 1)-symbolic.png
  done
}

# vim:set ts=2 sw=2 et:
