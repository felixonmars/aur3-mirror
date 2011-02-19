# Contributor: Majki <majki@majki.hu>
pkgname=ultimatepp
pkgver=3211
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Ultimate++ is a C++ cross-platform rapid application development IDE."
url="http://www.ultimatepp.org/"
license="BSD"
depends=('gcc' 'libxft' 'libnotify' 'libpng')
optdepends=('valgrind')
conflicts=('upp')
source=(http://downloads.sourceforge.net/project/upp/upp/$pkgver/upp-x11-src-$pkgver.tar.gz doinstall)
md5sums=('05d5227da145d681f57286e19bd59ff2' 'e229c42b8ce85a2fb2caf1400de0c712')

build() {
  cd $srcdir/upp-x11-src-$pkgver
  
  # patching this idiotic build system ;-)
  sed -i '/^CC\ =/s/\(.*\)/\1\ -O2\ -march=native/' uppsrc/Makefile
  sed -i '/^cp uppsrc/d' domake
  sed -i '/RELEASE_OPTIONS/s/-O1/-O2\ -march=native/' GCC.bm
  cp ../../doinstall doinstall

  make || return 1
  sh doinstall $pkgdir || return 1

  echo -e "\n  If you prefer command line, just type upp to start the IDE.\n  Have fun ;)\n"
}

