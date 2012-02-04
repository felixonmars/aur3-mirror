# Contributor : mightyjaym <jmambrosino@gmail.com>

pkgname=sdljava
pkgver=0.9.1
pkgrel=2
pkgdesc="Java binding to the SDL API"
arch=(i686 x86_64)
url="http://sdljava.sourceforge.net"
license=('LGPL')
depends=('java-environment' 'bsh' 'java-jdom' 'sdl')
makedepends=('ftgl' 'glew' 'sdl_gfx' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'apache-ant' 'swig' 'ruby')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz ${pkgname}-${pkgver}-regen.patch)
md5sums=('c28122f53f6c240c46bd08bc7588305a' '97a40541a202798d99f8fcb152325ead')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p1 < ../sdljava-0.9.1-regen.patch

  GCC_PATH=`gcc -print-search-dirs | grep install | cut -f 2 -d " "`
  sed -i "s#@GCC_INCLUDE_PATH@#$GCC_PATH/include#g" \
    etc/build/linux/Makefile \
    etc/build/gljava/linux/Makefile \
    etc/build/gljava/linux/ftgl/Makefile

  cd lib
  rm *.jar
  ln -s /usr/share/java/bsh.jar
  ln -s /usr/share/java/jdom/jdom.jar
  cd ..

  cp etc/build/linux/Makefile src/sdljava/native
  cp etc/build/gljava/linux/Makefile src/org/gljava/opengl/native
  cp etc/build/gljava/linux/ftgl/Makefile src/org/gljava/opengl/native/ftgl

  rm src/sdljava/native/SDL*_wrap.c src/sdljava/native/SDL_types.h
  rm src/org/gljava/opengl/native/glew_wrap.c

if [ "$CARCH" = "i686" ]; then
	export ARCH_DEFINE="-D__i386__"
else	export ARCH_DEFINE="-D__x86_64__"
fi

  cd src/sdljava/native
  make CFLAGS="-fno-strict-aliasing -fPIC"
  make libsdljava_gfx.so CFLAGS="-fno-strict-aliasing -fPIC"
  cd ../../org/gljava/opengl/native
  make CFLAGS="-fno-strict-aliasing -fPIC"
  cd ftgl
  make CFLAGS="-fno-strict-aliasing -fPIC"
  cd ${srcdir}/${pkgname}-${pkgver}
  ant jar javadoc

install -D -m644 ${srcdir}/${pkgname}-${pkgver}/lib/${pkgname}.jar ${pkgdir}/usr/share/java/${pkgname}.jar
mkdir -p ${pkgdir}/usr/lib/
install -m755 ${srcdir}/${pkgname}-${pkgver}/lib/*.so ${pkgdir}/usr/lib/

}