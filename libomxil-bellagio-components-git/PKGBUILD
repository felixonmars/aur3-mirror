# Maintainer: Joni Lapilainen <joni.lapilainen@gmail.com>
pkgname=libomxil-bellagio-components-git
pkgver=20120111
pkgrel=1
pkgdesc="An opensource implementation of the OpenMAX Integration Layer API"
arch=('arm' 'armv7h' 'i686' 'x86_64')
url="http://omxil.sourceforge.net"
license="LGPL"
depends=('libomxil-bellagio-git' 'alsa-lib' 'ffmpeg-legacy' 'libjpeg' 'libmad' 'libx11' 'libxv' 'libid3tag' 'libvorbis' 'libtheora')
md5sums=()

_gitroot="git://omxil.git.sourceforge.net/gitroot/omxil/components"
_gitname="components"

build() {

 msg "Connecting to GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

cd $startdir/src/$_gitname

 cd alsa
 autoreconf -i -f
 ./configure --prefix=/usr --libdir=/usr/lib/bellagio
 make clean
 make
 make DESTDIR=${startdir}/pkg install
 cd ..

 cd camera
 autoreconf -i -f
 ./configure --prefix=/usr --libdir=/usr/lib/bellagio
 make clean
 make
 make DESTDIR=${startdir}/pkg install
 cd ..

 cd fbvideo
 autoreconf -i -f
 ./configure --prefix=/usr --libdir=/usr/lib/bellagio
 make clean
 make
 make DESTDIR=${startdir}/pkg install
 cd ..

 cd ffmpeg-dist
 autoreconf -i -f
 mv configure configure.orig
 sed 's/ -Werror//g' configure.orig > configure
 chmod +x configure
 ./configure --prefix=/usr --libdir=/usr/lib/bellagio
 make clean
 make
 make DESTDIR=${startdir}/pkg install
 cd ..

 cd ffmpeg-nonfree
 autoreconf -i -f
 mv configure configure.orig
 sed 's/ -Werror//g' configure.orig > configure
 chmod +x configure
 ./configure --prefix=/usr --libdir=/usr/lib/bellagio
 make clean
 make
 make DESTDIR=${startdir}/pkg install
 cd ..

 cd jpeg
 autoreconf -i -f
 ./configure --prefix=/usr --libdir=/usr/lib/bellagio
 make clean
 make
 make DESTDIR=${startdir}/pkg install
 cd ..

 cd mad
 autoreconf -i -f
 ./configure --prefix=/usr --libdir=/usr/lib/bellagio
 make clean
 make
 make DESTDIR=${startdir}/pkg install
 cd ..  

 cd videosrc
 autoreconf -i -f
 mv configure configure.orig
 sed 's/ -Werror//g' configure.orig > configure
 chmod +x configure
 ./configure --prefix=/usr --libdir=/usr/lib/bellagio
 make clean
 make
 make DESTDIR=${startdir}/pkg install
 cd ..

 cd vorbis
 autoreconf -i -f
 mv configure configure.orig
 sed 's/ -Werror//g' configure.orig > configure
 chmod +x configure
 ./configure --prefix=/usr --libdir=/usr/lib/bellagio
 make clean
 make
 make DESTDIR=${startdir}/pkg install
 cd ..

 cd xvideo
 autoreconf -i -f
 ./configure --prefix=/usr --libdir=/usr/lib/bellagio
 make clean
 make
 make DESTDIR=${startdir}/pkg install
 cd ..

 cd theora
 autoreconf -i -f
 mv configure configure.orig
 sed 's/ -Werror//g' configure.orig > configure
 chmod +x configure
 ./configure --prefix=/usr --libdir=/usr/lib/bellagio
 make clean
 make
 make DESTDIR=${startdir}/pkg install
 cd ..

 cd examples
 autoreconf -i -f
 mv configure configure.orig
 sed 's/ -Werror//g' configure.orig > configure
 chmod +x configure
 ./configure --prefix=/usr --libdir=/usr/lib/bellagio
 make clean
 make
 make DESTDIR=${startdir}/pkg install
 cd ..

 cd template_audio_components
 autoreconf -i -f
 mv configure configure.orig
 sed 's/ -Werror//g' configure.orig > configure
 chmod +x configure
 ./configure --prefix=/usr --libdir=/usr/lib/bellagio
 make clean
 make
 make DESTDIR=${startdir}/pkg install
 cd ..

}

