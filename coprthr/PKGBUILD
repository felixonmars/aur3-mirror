# Maintainer: YL3DY <yl3gdy at archlinux dot us>

pkgname=coprthr
pkgver=1.2.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.browndeertechnology.com/coprthr.htm"
license=('LGPL')
depends=('opencl-headers' 'libcl')
provides=('libstdcl')
source=("https://github.com/browndeer/${pkgname}/tarball/v${pkgver}-rc1")
md5sums=('deeeee35ab582a532c303056a52b8f05')

pkgdesc="The CO-PRocessing THReads (COPRTHR) SDK provides several OpenCL-related libraries and tools."

build() {
  cd $srcdir/browndeer-${pkgname}-bac0c8a

  ./configure --prefix=/usr \
              --disable-libocl 
   make MAKE=make
}

package() {
  cd $srcdir/browndeer-${pkgname}-bac0c8a/
  make MAKE=make prefix="$pkgdir/usr/" install

  cd $pkgdir
  mkdir -p usr/share/$pkgname

  mv usr/install-message.txt usr/share/$pkgname
  rm -r usr/include/CL

  # tidy docs and examples
  mv usr/doc/ usr/share/$pkgname/
  mv usr/examples/ usr/share/$pkgname/
  mv usr/test/ usr/share/$pkgname/

  # align test makefile
  sed 's/gmake/make/g' usr/share/$pkgname/test/Makefile > tmp
  mv tmp usr/share/$pkgname/test/Makefile
  sed 's/gmake/make/g' usr/share/$pkgname/test/Makefile.in > tmp
  mv tmp usr/share/$pkgname/test/Makefile.in
}
