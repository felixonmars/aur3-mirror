# Maintainer: Your Name <alculquicondor@gmail.com>
pkgname=mrsid_dsdk
pkgver=9.1.0.4045
pkgrel=1
pkgdesc="MrSID Decode SDK for Raster. MrSID is a file format developed and patented by LizardTech for encoding of georeferenced raster graphics, such as orthophotos."
arch=('i686' 'x86_64')
url="http://www.lizardtech.com/"
license=('custom')
groups=()
depends=(gcc-libs-multilib)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(mrsid_dsdk.conf)
md5sums=('180c76aa72a9cfcef3e1bcb533f8b336')
if test "$CARCH" == x86_64; then
  _srcdir=MrSID_DSDK-${pkgver}-linux.x86-64.gcc44
  source+=(http://bin.lizardtech.com/download/developer/${_srcdir}.tar.gz)
  md5sums+=('3dfaef4bc0eb512f52665e19c154724e')
else
  _srcdir=MrSID_DSDK-${pkgver}-linux.x86-64.gcc44
  source+=(http://bin.lizardtech.com/download/developer/${_srcdir}.tar.gz)
  md5sums+=('8772a9fb2e00ba3b0ed3f9303152965c')
fi
noextract=()

package() {
  install -d $pkgdir/etc/ld.so.conf.d
  install mrsid_dsdk.conf $pkgdir/etc/ld.so.conf.d
  cd $srcdir/$_srcdir
  install -d $pkgdir/usr/share/mrsid_dsdk
  install -D -m644 LICENSE.pdf ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf
  cp -r Raster_DSDK/* ${pkgdir}/usr/share/mrsid_dsdk
}
