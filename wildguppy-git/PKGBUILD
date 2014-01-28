# $Id$
# Maintainer: der_fenix <derfenix@gmail.com>

pkgname=wildguppy-git
pkgver=r44.0e11a33
pkgrel=3
pkgdesc="Adjusts a laptop's brightness automatically, by using camera samples taken at a user definable interval"
url="https://github.com/bilegt/autobrightness/"
arch=('any')
license=('GPL')
makedepends=('git')
depends=('python2' 'xorg-xbacklight' 'fswebcam' 'python2-pillow' 'libappindicator3')
provides=('wildguppy')
conflicts=('wildguppy')
source=("$pkgname"::'git+https://github.com/bilegt/autobrightness.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	echo "Installing package"
   cd "${srcdir}/${pkgname}"
   mkdir -p ${pkgdir}/usr/{lib/wildguppy,bin,share/pixmaps,share/applications}
	sed -i "s/\/usr\/bin\/python/\/usr\/bin\/python2/g" *.py
	sed -i "s/env python/env python2/g" *.py
	sed -i "s/import Image/from PIL import Image/g" *.py
	sed -i "s/\/opt\/wildguppy\/icon\//\/usr\/share\/pixmaps\//g" *.py
	cp -vf *.py "${pkgdir}/usr/lib/wildguppy/"
	cp -vf *.png "${pkgdir}/usr/share/pixmaps"
	echo "python2 /usr/lib/wildguppy/wildguppy.py"> "${pkgdir}/usr/bin/wildguppy"
	chmod +x "${pkgdir}/usr/bin/wildguppy"
	echo "python2 /usr/lib/wildguppy/panel_app.py"> "${pkgdir}/usr/bin/wildguppy-gtk"
	chmod +x "${pkgdir}/usr/bin/wildguppy-gtk"
	sed -i "s/Icon=\/opt\/wildguppy\/icon/Icon=\/usr\/share\/pixmaps/g" wildguppy.desktop
	cp -vf wildguppy.desktop "${pkgdir}/usr/share/applications"
}
