# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Maintainer: Ganymede

pkgname=cinelerra-monty
pkgver=20110117
pkgrel=1
pkgdesc="Monty Montgomery's working fork of cinelerra-cv. Intended for testing and debugging purposes, can be installed alongside cinelerra-cv."
arch=('i686' 'x86_64')
url="http://git.xiph.org/?p=users/xiphmont/cinelerraCV.git;a=summary"
license=('GPL')
depends=('e2fsprogs' 'a52dec' 'fftw' 'lame' 'libavc1394' 'libiec61883'
	 'libraw1394' 'libsndfile' 'libvorbis' 'libogg' 'libpng>=1.4.0'
	 'libjpeg>=8' 'libtiff' 'esound' 'mjpegtools' 'openexr' 'x264'
	 'libxxf86vm' 'ffmpeg' 'libxv' 'faad2' 'faac' 'libtheora' 'freetype2')
makedepends=('automake>=1.7' 'autoconf>=2.57' 'libtool' 'git' 'nasm'
	     'libgl' 'mesa')
optdepends=('libgl: needed for the X11-OPENGL video driver support')
options=('!libtool')
source=()

_gitroot="git://git.xiph.org/users/xiphmont/cinelerraCV.git"
_gitname="cinelerraCV"

build() {
  cd "${srcdir}"
  unset LDFLAGS
  export CPPFLAGS="${CPPFLAGS} -D__STDC_CONSTANT_MACROS"
  [ -d ${srcdir}/tmpdir ] || mkdir ${srcdir}/tmpdir
  export TMPDIR=${srcdir}/tmpdir

  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/$_gitname-build"
  cp -r "${srcdir}/$_gitname" "${srcdir}/$_gitname-build"
  cd "${srcdir}/$_gitname-build"

  # If you don't need OpenGL comment out the next line.
  sed -i '/\/X11R6/s///' configure.in

  ./autogen.sh

  if [ "$CARCH" = "x86_64" ]; then
	  ./configure --prefix=/opt --with-buildinfo=git/recompile --disable-mmx --enable-opengl
  else
	  ./configure --prefix=/opt --with-buildinfo=git/recompile --enable-mmx --enable-opengl
  fi

  make || return 1
}

package() {
  cd "${srcdir}/$_gitname-build"

  make DESTDIR=${pkgdir} install
}
md5sums=()
