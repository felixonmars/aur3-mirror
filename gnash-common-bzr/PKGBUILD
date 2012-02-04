# Contributor: Matthew Bauer <mjbauer95@gmail.com>
pkgname=gnash-common-bzr
_realname=gnash-common
pkgver=1
pkgrel=1
pkgdesc="Gnash is an open source flashplayer."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gnash/"
license=('GPL')
depends=('agg' 'atk' 'libxml2' 'curl' 'libtool' 'ffmpeg' 'boost' 'pango' 'libxi')
#ffmpeg-svn libdc1394
provides=(${_realname})
conflicts=(${_realname})

_bzrbranch=http://bzr.savannah.gnu.org/r/gnash/trunk
_bzrmod=trunk

build() {
  cd ${srcdir}

  msg "Connecting to the server...."

  bzr branch ${_bzrbranch} -q

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  [ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
  cp -r ./${_bzrmod} ./${_bzrmod}-build
  cd ./${_bzrmod}-build

  sh autogen.sh 
  ./configure --prefix=/usr \
                    --disable-kparts \
                    --disable-nsapi \
                    --enable-gui=gtk \
                    --enable-z --enable-jpeg \
                    --enable-renderer=agg \
                    --enable-media=ffmpeg \
                    --enable-write \
                    --disable-cygnal
   make || return 1
   make DESTDIR=$startdir/pkg install
   rm -rf $startdir/pkg/opt
   rm -f $startdir/pkg/usr/bin/gtk-gnash
}
