# Contributor: Juanma Hernandez <juanmah@gmail.com>

pkgname=pana
pkgver=1.4.16
pkgrel=2
pkgdesc="Pana - the audio player for people who hate change (Amarok 1.4.10 fork)"
arch=("i686" "x86_64")
url="http://pana.bunnies.net/"
license=('GPL')
depends=('xine-lib>=1.1.3' 'libmysqlclient>=5.0.45' 'postgresql-libs>=8.2.4' 'ruby' 'tunepimp>=0.5.3' 'kdelibs3>=3.5.7' 'libgpod>=0.6.0'  'libifp>=1.0.0.2' 'libnjb>=2.2.5' 'libvisual>=0.4.0' 'libmtp')
makedepends=('pkgconfig' 'kdelibs3' 'libmtp>=0.2.6.1' 'xine-lib>=1.1.8' 'sdl>=1.2.12')
conflicts=('amarok1')
provides=('pana')
source=("http://launchpad.net/pana/trunk/${pkgver}/+download/pana-${pkgver}.tbz"
        "ruby19_configure2.patch"
        "ruby19_rstring.patch"
        "gcc45.patch")

build() {
  patch -Np0 -i $srcdir/ruby19_configure2.patch || return 1
  patch -Np0 -i $srcdir/ruby19_rstring.patch || return 1
  patch -Np0 -i $srcdir/gcc45.patch || return 1

  cd ${startdir}/src/${pkgname}-${pkgver}

  # prepare build
#  RUBY=/opt/ruby1.8/bin/ruby ./configure --prefix=${startdir}/pkg`kde-config --prefix` \
  ./configure --prefix=${startdir}/pkg`kde-config --prefix` \
        --with-gnu-ld \
        --enable-mysql \
        --enable-postgresql \
        --with-mp4v2 \
        --with-ifp \
        --with-libnjb \
        --with-libmtp \
        --with-libgpod \
        --without-arts \
        --without-gstreamer \
        --with-xine \
        --without-nmm \
        --without-mas \
        --with-libvisual \
        --disable-debug \
        --enable-debug=no \
        --without-xmms || return 1

  # build
  sed -i -e 's/konquisidebar//g' pana/src/Makefile
  make || return 1
  make install || return 1

}
md5sums=('a4dd4b36b9477023be208f980a3fff55'
         'ed0104f3ab1642cd57dbf34ef2d9634c'
         'f3753fd75029bd56fddf8ce43350e15b'
	 '1e9811f727b584d666231cf91659894e')
