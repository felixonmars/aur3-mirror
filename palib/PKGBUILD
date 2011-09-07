# Maintainer: Gerardo Marset <gammer1994@gmail.com>
# Contributor: Alain
pkgname=palib
pkgver=100707
pkgrel=1
pkgdesc="An easy-to-use development library and toolset for the Nintendo DS"
license=('GPL2')
arch=('i686' 'x86_64')                                                          
url="http://palib-dev.com/"
makedepends=('p7zip')
depends=('devkitarm>=r27' 'dswifi>=0.3.11' 'libnds>=1.4.0' 'libfat-nds>=1.0.6'  'alsa-lib' 'gtk2' 'libgl')
source=(http://palib-dev.com/PAlib$pkgver.7z
        "http://downloads.sourceforge.net/sourceforge/devkitpro/libfilesystem-0.9.9.tar.bz2")
md5sums=('740efad08dcd9a9aa9ec915e2b14c16f' 'e24a5248360034bd425dabcbf6cd1629')
options=(!strip)


build() {
  cd $startdir/src

  mkdir -p $pkgdir/opt/devkitpro/libnds
  cp -r include $pkgdir/opt/devkitpro/libnds/
  cp -r lib $pkgdir/opt/devkitpro/libnds/

  7z x ../PAlib$pkgver.7z -oPAlib
  mkdir -p $pkgdir/opt/devkitpro/PAlib
  ls
  cp -r PAlib $pkgdir/opt/devkitpro
  chmod -R 755 $pkgdir/opt/devkitpro/PAlib
}
