# Contributor: vn158 <vn158 at seznam dot cz>
pkgname=vxatool
pkgver=4.62
pkgrel=1
pkgdesc="diagnostic program for VXA-1, VXA-2, VXA-172 and VXA-320 tape drives"
arch=(i686 x86_64)
url="http://www.tandbergdata.com/"
license=('custom')
depends=()
makedepends=()
source=(ftp://ftp.exabyte.com/pub/tools/vxa/vxaTool_Linux_V4.62.tar.gz)
md5sums=('854eaca4dd9553c3f20d5aaf62ee8689')
noextract=()
options=(!strip)

build() {
  cd $startdir
  install -d -m755 pkg/usr/bin
  install -m755 src/Linux/vxaTool pkg/usr/bin
}
