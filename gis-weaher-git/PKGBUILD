# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Atsushi Ichiki <hitotuky [at] gmail dot com>
pkgname=gis-weaher-git
pkgver=0.7.7
pkgrel=1
pkgdesc="Customizable weather widget"
arch=('i686' 'x86_64')
url="https://github.com/RingOV/gis-weather"
license=('GPLv3')
groups=()
depends=('gtk3' 'python' 'python-gobject' 'python-cairo-git')
makedepends=('git')
provides=()
conflicts=('gis-weather')

source=("${pkgname}::git://github.com/RingOV/gis-weather")
md5sums=('SKIP')

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/gis-weather
  mkdir -p ${pkgdir}/usr/share/applications
  cp -R $srcdir/$pkgname/. $pkgdir/usr/share/gis-weather
  rm -fr $pkgdir/usr/share/gis-weather/.git
  chmod -R 777 $pkgdir/usr/share/gis-weather 
  echo "exec python3 /usr/share/gis-weather/gis-weather.py $*" > ${pkgdir}/usr/bin/gis-weather
  chmod 755 ${pkgdir}/usr/bin/gis-weather
  echo "[Desktop Entry]
Name=Gis Weather
Comment=Weather widget
Categories=GNOME;Utility;
Exec=/usr/bin/gis-weather
Icon=/usr/share/gis-weather/icon.png
Terminal=false
Type=Application" > $pkgdir/usr/share/applications/gis-weather.desktop
  #install -Dm644 "gis-weather.desktop" "$pkgdir/usr/share/applications/gis-weather.desktop"
  #install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

