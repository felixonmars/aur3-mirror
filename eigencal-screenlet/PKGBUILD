# Contributor: twa022 <twa022 at gmail dot com>

pkgname=eigencal-screenlet
pkgver=3.21
pkgrel=2
pkgdesc="Calendar screenlet with .ics support"
arch=('any')
url="http://gnome-look.org/content/show.php/eigenCal+-+Calendar+Screenlet?content=115976"
license=('GPL')
depends=('screenlets' 'libical')
groups=('screenlets-extra')
source=("http://gnome-look.org/CONTENT/content-files/115976-eigenCalScreenlet-${pkgver}.tar.gz")
build() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/screenlets
  sed -i 's:/usr/bin/env python:&2:g' ${srcdir}/eigenCal/*py
  sed -i 's:/usr/bin/python:&2:g' ${srcdir}/eigenCal/*py
  cp -r $srcdir/eigenCal $pkgdir/usr/share/screenlets/
}

md5sums=('787cc783b0750f11b9b5fbde86c05bae')
