# Maintainer: Mihai Militaru <mihai dot militaru at gmx dot com>

pkgname=maya2011
pkgver=2011.0.419
pkgrel=4
pkgdesc="3D Animation, Visual Effects, and Compositing Software"
arch=('x86_64')
url="http://www.autodesk.com/maya"
license=('proprietary')
depends=('libgl' 'mesa' \
	'libxp' 'libxmu' 'libxt' 'libxi' 'libxext' 'libx11' 'libxinerama' 'libxau' 'libxcb' \
	'gamin' 'audiofile' 'util-linux-ng' 'glibc' 'zlib' 'libsm' 'libice' 'openssl' \
	'tcsh' 'ttf-liberation' 'libpng12' 'libjpeg6' \
	'xorg-fonts-100dpi' 'xorg-fonts-75dpi')
optdepends=('maya2011-docs: html documentation reference')
makedepends=('rpmextract')
source=(http://images.autodesk.com/adsk/files/autodesk_maya_2011_sp1_linux_64bit.tgz
	ljpeg6_preload.patch)
md5sums=('71b57f45363b3c7cba82f448ea8a8015' '4240936cc76555225321be135f15bc12')
install=maya2011.install
options=('!strip')

build() {
  cd "$pkgdir"
  rpmextract.sh "$srcdir"/adlmapps3-3.0.17-0.x86_64.rpm
  rpmextract.sh "$srcdir"/adlmflexnetclient-3.0.17-0.x86_64.rpm
  rpmextract.sh "$srcdir"/Maya2011_0_64-2011.0-419.x86_64.rpm
  install -Dm644 "$srcdir/EULA/All Other Countries.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  patch -Np0 -i "$srcdir"/ljpeg6_preload.patch
}
