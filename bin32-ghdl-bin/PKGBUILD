# Written from package ghdl-bin
# Note: invoke ghdl with these flags: -Wc,-m32 -Wa,--32 -Wl,-m32 -Wl,-L/usr/lib32

pkgname=bin32-ghdl-bin
pkgver=0.29
pkgrel=1
pkgdesc="Complete VHDL  simulator, using the GCC  technology"
arch=('x86_64')
url="http://ghdl.free.fr/"
license=('GPL')
source=(http://ghdl.free.fr/ghdl-${pkgver}-i686-pc-linux.tar)
md5sums=('3105ffa575244f30d79855e25e5f7816')

depends=('gcc-multilib' 'lib32-gcc-libs' 'lib32-zlib')
conflicts=('ghdl' 'ghdl-bin')

options=('staticlibs')

package()  {
  cd ${srcdir}/ghdl-${pkgver}-i686-pc-linux
  tar -C ${pkgdir} -jxvf ghdl-${pkgver}-i686-pc-linux.tar.bz2
  #mv  ${pkgdir}/usr/local/* ${pkgdir}/usr/
  #rm -r ${pkgdir}/usr/local
}
