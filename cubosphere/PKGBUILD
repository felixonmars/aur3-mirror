# Maintainer: Bernd Pruenster <bernd.pruenster@gmail.com>

pkgname=cubosphere
pkgver=0.3
pkgrel=1
pkgdesc="3d puzzle similar to Kula World/Roll Away"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/cubosphere/"
license=('GPL')
depends=('libjpeg' 'lua51' 'sdl_ttf' 'sdl_mixer' 'glew')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}_beta${pkgver}_linux_src.tar.gz
 $pkgname.desktop)
md5sums=('4ed44769c09fb559d12a35518564dce4'
         '7f7afe94baa3f22f96792b7ff18bd7ac')
PKGEXT=".tar"
build() {
  cd $srcdir/${pkgname}_beta${pkgver}/
#  sed -i -e 's/5.1//g' -e '/^PREFIX/s/\/local//' Makefile
  
#LINUXCC="g++"
#LINUXARGS="-I/usr/include/lua5.1"
#LINUXLINK="-llua5.1 -lGL -lSDL_mixer -lSDL_ttf -lSDL -ljpeg -lGLU -o ../cubosphere -O3 -s -lGLEW -DGLEW_STATIC"

#WINDOWSCC="i586-mingw32msvc-g++"
#WINDOWSARGS="-O3  -DGLEW_STATIC -DMINGW_CROSS_COMPILE  -DWINVER=0x0400 -D__WIN95__ -D__GNUWIN32__ -DSTRICT -DHAVE_W32API_H -D__WXMSW__ -D__WINDOWS__   -I/usr/i586-mingw32msvc/include/ -I/usr/i586-mingw32msvc/include"
#WINDOWSLINK="resource.res -L/usr/i586-mingw32msvc/lib -L/usr/i586-mingw32msvc/lib  -o ../cubosphere.exe  -s -mwindows  -lmingw32 -lglew32s -lopengl32 -lglu32 -lSDLmain -lSDL -llua5.1 -ljpeg -lSDL_mixer -lSDL_ttf"


cd src
make




#echo "Linux Compile"
#for srcfile in *.cpp; do
# echo "   ==>Compiling $srcfile"
# $LINUXCC -c $srcfile $LINUXARGS || exit 1;
#done;

#echo " Linking Linux Target"
#$LINUXCC *.o $LINUXLINK || exit 1;


}

package() {
  cd $srcdir/${pkgname}_beta${pkgver}/
  cd src
  make install DESTDIR=$pkgdir
  chmod -R +r $pkgdir/*
  
  install -D -m644 $srcdir/cubosphere.desktop $pkgdir/usr/share/applications/cubosphere.desktop
}
