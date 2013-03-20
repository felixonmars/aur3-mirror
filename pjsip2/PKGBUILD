# Contributor: Travis Hegner < travis.hegner AT gmail DOT com >

pkgname=pjsip2
pkgver=2.1
pkgrel=3
pkgdesc="comprehensive, high performance, small footprint multimedia communication libraries written in C"
arch=(i686 x86_64)
url="http://www.pjsip.org"
license=('GPL')
depends=(openssl portaudio speex alsa-lib libsamplerate util-linux-ng)
options=(!distcc)
source=(http://www.pjsip.org/release/$pkgver/pjproject-$pkgver.tar.bz2)
md5sums=('310eb63638dac93095f6a1fc8ee1f578')

build() {
  cd "$srcdir/pjproject-$pkgver.0"
  #[ $NOEXTRACT -eq 1 ] || ./configure --prefix=/usr --with-external-speex --with-external-pa --enable-epoll --disable-oss --enable-libsamplerate
  [ $NOEXTRACT -eq 1 ] || ./configure --prefix=/usr --with-external-speex --with-external-pa --disable-oss --enable-libsamplerate

  mkdir -p third_party/libsamplerate/src
  cp /usr/include/samplerate.h third_party/libsamplerate/src
  echo "#define PJMEDIA_RESAMPLE_IMP PJMEDIA_RESAMPLE_LIBSAMPLERATE" >> pjlib/include/pj/config_site.h

  #Override of -j because this package will not consistently build with multiple processes.
  make -j1 dep
  make -j1
  make -j1 DESTDIR="$pkgdir/" install

  #Commented because I don't need these
  #install -D -m 755 pjsip-apps/bin/pjsua-`/usr/share/libtool/config/config.guess` $pkgdir/usr/bin/pjsua
  #install -D -m 755 pjsip-apps/bin/pjsystest-`/usr/share/libtool/config/config.guess` $pkgdir/usr/bin/pjsystest
}

