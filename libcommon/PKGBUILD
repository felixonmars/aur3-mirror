# Contributor: Manuel "ekerazha" C. (www.ekerazha.com)

pkgname=libcommon
pkgver=0.2.0
pkgrel=1
pkgdesc="A reusable library written in C#."
arch=('i686' 'x86_64')
url="http://libcommon.sourceforge.net"
license=('MIT')
depends=('gtk-sharp-2')
source=(http://switch.dl.sourceforge.net/sourceforge/libcommon/${pkgname}_$pkgver-3-src.tar.gz)
md5sums=('a19855117dfda89dc734203f0d011068')

build() {
  export MONO_SHARED_DIR=${startdir}/src/.wabi
  mkdir -p "${MONO_SHARED_DIR}"

  cd $startdir/src/${pkgname}_$pkgver-3
  sh autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
