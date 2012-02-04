#Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=xvbat
_mainver=0.9
_subver=404001
pkgver=${_mainver}.${_subver}
pkgrel=1
pkgdesc="AMDs XvBA sdk"
arch=('i686' 'x86_64')
url="http://developer.amd.com/zones/opensource/pages/default.aspx"
license=('custom')
depends=('gtk2' 'ffmpeg' 'catalyst-utils' 'framewave' 'libxvmc' 'mesa')
source=(http://sourceforge.net/projects/xvbat/files/xvbat-${_mainver}-${_subver}.tar.gz
	ffmpeg-deprecated-removed-symbols.patch)

build() {
  cd "${srcdir}/xvbat-${_mainver}-${_subver}"

  patch -p1 -i ../ffmpeg-deprecated-removed-symbols.patch

  LDFLAGS=""
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/xvbat-${_mainver}-${_subver}"

  mkdir -p				"${pkgdir}"/usr/{bin,lib,share/licenses/xvbat}

  cp -r *.so*				"${pkgdir}/usr/lib/"
  cp -r include				"${pkgdir}/usr/"
  cp -r xvba{info,play,trace.sh}	"${pkgdir}/usr/bin/"
  cp -r LICENSE				"${pkgdir}/usr/share/licenses/xvbat/"
}
md5sums=('9f928900b3f5ee2d7eb9ae33e09b9ca7'
         '6447142ba7964b38c3585910dcca8ac2')
