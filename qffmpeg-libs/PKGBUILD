pkgname=qffmpeg-libs
pkgver=0.4.9
pkgrel=2
pkgdesc="Stripped-down fork of ffmpeg for libspice"
arch=('i686' 'x86_64')
url="http://ffmpeg.org"
license=('GPL')
depends=(zlib)
makedepends=('rpmextract')
install=
source=(http://ftp.redhat.com/pub/redhat/linux/enterprise/5Client/en/os/SRPMS/${pkgname/-libs}-${pkgver}-0.16.20080908.el5_5.src.rpm)
noextract=()


build() {
  cd $srcdir
  rpmextract.sh ${pkgname/-libs}-${pkgver}-0.16.20080908.el5_5.src.rpm
  tar xjf qffmpeg-0.13.20080908-nopatents.tar.bz2
  cd "qffmpeg-20080908"
  patch -p1 -i ../libqavcodec-selinux.patch
  ./configure \
    --prefix=/usr \
    --incdir=/usr/include/qffmpeg \
    --libdir=/usr/lib \
    --shlibdir=/usr/lib \
    --mandir=%{_mandir} \
    --arch=x86_64 \
    --extra-cflags="-D_ISOC99_SOURCE -D_POSIX_C_SOURCE=200112 -fasm -std=c99 -fno-math-errno -fPIC" \
    --disable-demuxers \
    --disable-ffmpeg \
    --disable-ffserver \
    --disable-ffplay \
    --disable-bsfs \
    --disable-parsers \
    --disable-protocols \
    --disable-muxers \
    --disable-decoders \
    --disable-encoders \
    --enable-encoder=mjpeg \
    --enable-decoder=mjpeg \
    --enable-pthreads \
    --disable-static \
    --enable-shared \
    --enable-gpl \
    --disable-stripping

  make -j1 || return 1
  make DESTDIR="$pkgdir/" install || return 1
}

# vim:set ts=2 sw=2 et:
md5sums=('d16edb72cffc7744e67f8bf2779e8d21')
md5sums=('21848ff07456cfec9a724e6d03f64c72')
