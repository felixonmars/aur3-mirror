pkgname=('efl-server-git')
pkgver=20130312
pkgrel=1
pkgdesc="The EFL are a set of libraries for the Enlightenement project. This package will only provides whats needed for a server."
arch=('i686', 'x86_64')
url="http://www.enlightenment.org"
license=('BSD' 'LGPL2.1')
depends=('gnutls' 'glibc' 'libjpeg-turbo')
makedepends=('git' 'freetype2' 'xproto' 'libx11' 'libxrender' 'libgl' 
             'giflib' 'libtiff' 'libxcursor' 'libxcomposite'
             'libxinerama' 'libxp' 'libxrandr' 'libxtst' 'libxss'
             'lua51' 'libpng')
conflicts=('eet' 'eet-svn' 'eina' 'eina-svn' 'embryo' 'embryo-svn'
           'ecore' 'ecore-svn' 'evas' 'evas-svn' 'eio' 'eio-svn'
           'edbus' 'edbus-svn' 'eeze' 'eeze-svn' 'eo' 'eo-svn')
provides=('eet' 'eina' 'ecore' 'eio' 'edbus' 'eeze' 'eo')
options=('!libtool' '!emptydirs')
source=()
md5sums=()

_gitroot="git://git.enlightenment.org/core/efl.git"
_gitname="efl"

build()
{
  cd $srcdir

  if [ $NOEXTRACT -eq 0 ]; then
    msg "Connecting to $_gitroot GIT server...."
    if [ -d $_gitname/.git ]; then
      (cd $_gitname && git pull origin)
    else
      git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."
  fi
  cp -r $_gitname $_gitname-build
  cd $_gitname-build

  # We disable all the things we can to speed up compilation a little
  # But it still is too slow due to ecore-x, evas ...
  ./autogen.sh --prefix=/usr \
               --with-tests=none \
               --disable-physics \
               --disable-doc \
               --disable-valgrind \
               --disable-fontconfig \
               --disable-fribidi \
               --disable-gstreamer \
               --disable-tslib \
               --disable-audio \
               --disable-pulseaudio \
               --disable-xinput2 \
               --disable-xim
  make || return 1
}

package()
{
   cd $srcdir
   cd $_gitname-build

   install -Dm644 $srcdir/$_gitname/COPYING \
   $pkgdir/usr/share/licenses/$pkgname/COPYING

   make DESTDIR="$pkgdir" install

   # We remove all the useless stuff for a damn server!
   rm -r $pkgdir/usr/lib/{ecore_evas,evas,edje,efreet,ethumb,ethumb_client}
   
   if [ -e $pkgdir/usr/lib/libecore_sdl.so ]; then
      rm $pkgdir/usr/lib/libecore_sdl*
      rm $pkgdir/usr/include/ecore-1/Ecore_Sdl.h
   fi

   if [ -e $pkgdir/usr/lib/libecore_x.so ]; then
      rm $pkgdir/usr/lib/libecore_x*
   fi

   rm $pkgdir/usr/lib/lib{ecore_{evas,imf,input},embryo,evas,edje,efreet,emotion,ethumb}*
   rm $pkgdir/usr/bin/{edbus-codegen,edje_cc,edje_codegen,edje_decc,edje_external_inspector,edje_inspector,edje_pick,edje_player,edje_recc,edje_watch,efreetd,embryo_cc,ethumb,ethumbd,ethumbd_client,evas_cserve2_client,evas_cserve2_debug,evas_cserve2_usage,eina-bench-cmp}
   rm -r $pkgdir/usr/share/cmake/Modules/{Edje,Efreet,Evas}Config.cmake
   rm -r $pkgdir/usr/share/{ecore_imf,edje,efreet,embryo,emotion,ethumb,ethumb_client,evas,eo,dbus-1,mime}
   rm -r $pkgdir/usr/include
   rm -r $pkgdir/usr/lib/pkgconfig

   rm -r $startdir/src/$_gitname-build
}
