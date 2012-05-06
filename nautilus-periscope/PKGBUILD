# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=nautilus-periscope
pkgver=0.2.4
pkgrel=3
pkgdesc="Integration of Periscope in Nautilus menus."
arch=(any)
url="http://code.google.com/p/periscope"
license=(LGPL)
depends=('periscope' 'python-nautilus' 'nautilus<3' 'pyxdg')
conflicts=(${pkgname}-svn)
changelog=Changelog
source=("http://periscope.googlecode.com/files/python-periscope_${pkgver}.orig.tar.gz")
md5sums=('49df780245103697579551410a9acc49')

package() {
  install -Dm755 "${srcdir}/bin/periscope-nautilus/periscope-nautilus.py" "${pkgdir}/usr/share/nautilus-python/extensions/periscope-nautilus.py"
}
