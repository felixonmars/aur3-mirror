# Contributor: Gadget3000 <gadget3000@msn.com>
pkgname=gimp-plugin-stitchpanorama
pkgver=0.9.6
pkgrel=1
pkgdesc="A plug-in for GIMP which takes digital images and overlays one atop the other to make a panorama."
arch=('i686' 'x86_64')
url="http://stitchpanorama.sourceforge.net/"
license=(unknown)
depends=('gimp' 'python2')
source=(http://downloads.sourceforge.net/project/stitchpanorama/stitchpanorama/stitchpanorama%20${pkgver}/stitch_${pkgver}.py)
md5sums=(33f8fd286c6e5e4bcb433bb3588deaef)

build() {
  cd $srcdir
  install -D -m755 stitch_${pkgver}.py ${pkgdir}/usr/lib/gimp/2.0/plug-ins/stitch_${pkgver}.py
}
