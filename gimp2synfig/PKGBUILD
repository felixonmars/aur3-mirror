# Maintainer: Jonathan Schaeffer <Joschaeffer@gmail.com>
pkgname=gimp2synfig
pkgver=1.0
pkgrel=2
pkgdesc="Gimp plugin to export images to synfig format"
url="http://synfig.org/wiki/Gimp2synfig"
arch=('i686' 'x86_64')
license=('Creative Commons')
depends=(gimp)
source=(http://akhilman.googlepages.com/synfigexport.py)
md5sums=('34ff6a44ac3f31b6a4c76d96b2f0e313')


build() {
  cd $srcdir
  install -D -m755 synfigexport.py $pkgdir/usr/lib/gimp/2.0/plug-ins/synfigexport.py
}
