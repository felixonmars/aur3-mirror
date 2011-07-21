# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Maintainer: John Gerritse <reaphsharc@gmail.com>
pkgname=blender-innerworld
pkgver=0.0.7
pkgrel=4
pkgdesc="A landscape generator plugin for Blender"
arch=('i686' 'x86_64')
url="http://innerworld.sourceforge.net/"
license=('GPL')
depends=('blender' 'python')
optdepends=('python-numpy')
source=(http://downloads.sourceforge.net/innerworld/innerworld-${pkgver}.tgz)
md5sums=('70d7225208b1a34d3705f1b760f28255')

build() {
  mkdir -p ${pkgdir}/usr/share/blender/scripts
  install -m644 innerworld-${pkgver}/src/*.py ${pkgdir}/usr/share/blender/scripts/
}

# vim:set ts=2 sw=2 et:
