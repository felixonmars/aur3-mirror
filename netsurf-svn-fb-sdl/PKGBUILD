# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Thanks to: Georgij Kondratjev <smpuj@bk.ru>
pkgname=netsurf-svn-fb-sdl
pkgver=13418
pkgrel=1
pkgdesc="Lightweight and fast web browser"
arch=('i686' 'x86_64')
url="http://www.netsurf-browser.org/"
license=("GPL")
depends=('libnsfb-svn' 'libmng' 'curl' 'libglade' 'lcms' 'librsvg' 
'libnsbmp-svn' 'libnsgif-svn' 'libcss-svn' 'hubbub-svn' 'libdom-svn')
makedepends=('re2c' 'setconf' 'curl')
provides=('netsurf')
conflicts=('netsurf')
_svntrunk=svn://svn.netsurf-browser.org/trunk/netsurf
_svnmod=netsurf-svn

build() {
  cd "$srcdir"

  msg "Fetching two extra files..."
#  curl http://www.sqlite.org/cvstrac/getfile/sqlite/tool/lemon.c -O || return 1
#  curl http://www.sqlite.org/cvstrac/getfile/sqlite/tool/lempar.c -O || return 1
curl http://www.sqlite.org/src/raw/tool/lemon.c?name=445f18999b700d83b83a5d9be00c596546c21052 -o lemon.c
curl http://www.sqlite.org/src/raw/tool/lempar.c?name=01ca97f87610d1dac6d8cd96ab109ab1130e76dc -o lempar.c

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"

  msg "Preparing..."
  gcc lemon.c -o lemon
  PATH=`pwd`:$PATH

  cp -rT $_svnmod $_svnmod-build
  ln -sf $_svnmod-build netsurf #will not compile otherwise
  cd netsurf

  # Haru PDF doesn't compile
  setconf Makefile.defaults NETSURF_USE_HARU_PDF NO
  setconf Makefile.defaults NETSURF_FB_FRONTEND sdl
  sed -i -e 's|png_set_gray_1_2_4_to_8|png_set_expand_gray_1_2_4_to_8|' ./framebuffer/convert_image.c
  msg "Compiling Netsurf..."
  make TARGET=framebuffer || return 1
  
  msg "Creating wrapperscript..."
  echo "#!/bin/sh" >> netsurf.sh
  echo "NETSURFRES=/usr/share/netsurf/res /usr/bin/nsfb \$*" >> netsurf.sh

  msg "Packaging executables..."
  mkdir -p ${pkgdir}/usr/bin
  install nsfb ${pkgdir}/usr/bin
  install -Dm755 netsurf.sh ${pkgdir}/usr/bin/netsurf
  install -d ${pkgdir}/usr/bin ${pkgdir}/usr/share/netsurf

  msg "Packaging resources..."
  rm -rf framebuffer/res/.svn gtk/res/docs/.svn
  cp -RL framebuffer/res ${pkgdir}/usr/share/netsurf

  msg "Cleaning up..."
  find "$pkgdir" -name ".svn" -print0 | xargs -0 rm -rf
}
