# Maintainer: Somebody <somebody[at]foo[dot]tld>
pkgname=skeinforge
pkgver=50
pkgrel=1
pkgdesc="Skeinforge is a tool chain composed of Python scripts that converts your 3d model into G-Code instructions for RepRap."
url="http://fabmetheus.crsndoo.com/"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('python2' 'printrun-git')
makedepends=('python2')
source=("http://fabmetheus.crsndoo.com/files/50_reprap_python_beanshell.zip")

#build() {
  #cd "${srcdir}/${pkgname}-${pkgver}"
  #cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  #make
#}

package() {
  mkdir -p ${pkgdir}/usr/lib/printrun/skeinforge
  cd "${srcdir}"
  chmod a+x documentation fabmetheus_utilities  models  skeinforge_application
  cp -a documentation fabmetheus_utilities  models  skeinforge_application  ${pkgdir}/usr/lib/printrun/skeinforge
  install -Dm644 __init__.py terminal.sh  test.stl ${pkgdir}/usr/lib/printrun/skeinforge
  #python2 skeinforge_application/skeinforge.py
}

# vim:set ts=2 sw=2 et:
md5sums=('95e2a34660106d727411fdfaba404513')
