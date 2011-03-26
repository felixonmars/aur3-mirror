# Contributor: Matthew Bauer <mjbauer95@gmail.com>
# Contributor: flamelab
pkgname=gnash-bzr
pkgver=1
pkgrel=1
pkgdesc="Gnash is an open source flashplayer."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gnash/"
license=('GPL')
depends=('agg' 'atk' 'libxml2' 'curl' 'libtool' 'ffmpeg' 'boost' 'pango' 'libxi' 'libva')
#ffmpeg-svn libdc1394
makedepends=('bzr')
provides=(gnash-common gnash-gtk)
conflicts=(gnash-common gnash-gtk)

_bzrbranch=http://bzr.savannah.gnu.org/r/gnash/trunk
_bzrmod=gnash

build() {
  cd ${srcdir}

  msg "Connecting to the server...."

  if [ ! -d ./${_bzrmod} ]; then
    bzr co ${_bzrbranch} ${_bzrmod}
  else
    bzr up ${_bzrmod}
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  [ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
  cp -r ./${_bzrmod} ./${_bzrmod}-build
  cd ./${_bzrmod}-build

  sh autogen.sh 
  sed -i 's/liblibva/libva/g' configure
 # sed -i 's/use_libva=no/use_libva=yes/g' configure.ac
 # sed -i 's/use_vliba_x11=no/use_vliba_x11=yes/g' configure.ac
 LIBVA_CONFIG=/usr/include/va
  ./configure --prefix=/usr  --sysconfdir=/etc \
                    --with-npapi-plugindir=/usr/lib/mozilla/plugins \
                    --enable-gui=gtk \
                    --enable-z \
                    --enable-jpeg \
                    --enable-renderer=agg \
                    --enable-media=ffmpeg \
                    --enable-write \
                    --disable-cygnal \
                    
   make || return 1
}

package(){
    cd $srcdir/${_bzrmod}-build
   make DESTDIR=$pkgdir install
   mkdir -p ${pkgdir}/usr/lib/mozilla/plugins/
   install -Dm644 $srcdir/${_bzrmod}-build/plugin/npapi/.libs/libgnashplugin.so ${pkgdir}/usr/lib/mozilla/plugins/
}
