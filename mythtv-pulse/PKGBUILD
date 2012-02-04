# $Id: PKGBUILD 85283 2010-07-11 10:47:23Z ibiru $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: <kleptophobiac@gmail.com>
# Contributor: dorphell <dorphell@archlinux.org>

#Contributor: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=mythtv-pulse
pkgver=25260
pkgrel=1
pkgdesc="A Homebrew PVR project"
arch=('i686' 'x86_64')
url="http://www.mythtv.org/"
license=('GPL')
depends=('mysql-clients' 'qt' 'lame' 'lirc-utils' 'ffmpeg' 'libxvmc' 'fribidi'
         'perl-soap-lite' 'perl-date-manip' 'perl-xml-sax' 'perl-math-round'
         'perl-net-upnp' 'perl-dbd-mysql' 'perl-time-hires' 'libavc1394' 'wget'
         'libiec61883' 'mysql-python' 'mesa' 'libxinerama' 'libxrandr' 'faad2')
makedepends=('yasm')
optdepends=('xmltv: to download tv listings')
replaces=('mythtv-contrib')
conflicts=('mythtv-contrib' 'mythtv')
provide=('mythtv')
backup=('etc/conf.d/mythbackend')
install=mythtv.install
source=(ftp://mirrors.kernel.org/archlinux/other/mythtv/mythtv-${pkgver}.tar.xz
        mythbackend
        archlinux.conf.d.mythbackend)
md5sums=('cf07023b48e9b84b0f01fc6d8f0ce2a5'
         'feadcc9ad064d93d6dceab1efc0bd9ed'
         'bb8e4033d82428d827570fae9ba15e6a')

build() {
  cd "${srcdir}/mythtv"

  ARCH=${CARCH/_/-}
  ./configure --prefix=/usr --cpu=${ARCH} \
              --enable-mmx \
              --disable-audio-oss \
              --disaböe-audio-alsa \
              --disable-audio-jack \
              --enable-audio-pulse \
              --disable-altivec \
              --disable-distcc \
              --disable-ccache \
              --enable-ffmpeg \
              --enable-vdpau \
              --enable-libfaad \
              --enable-glx-procaddrarb \
              --enable-dvb \
              --enable-lirc \
              --enable-joystick-menu \
              --enable-v4l \
              --enable-ivtv \
              --enable-dvb \
              --dvb-path=/usr/include \
              --enable-xvmc \
              --enable-xvmcw \
              --enable-xvmc-pro \
              --enable-xvmc-vld \
              --enable-firewire \
              --enable-fribidi \
              --enable-opengl-vsync \
              --enable-xrandr \
              --enable-xv \
              --enable-x11 \
              --with-bindings=perl,python

  qmake mythtv.pro
  make all
}

package(){
  cd $srcdir/mythtv
  # basic install
  make INSTALL_ROOT="${pkgdir}" install
  install -D -m0755 ${srcdir}/mythbackend "${pkgdir}/etc/rc.d/mythbackend"
  # config file
  install -D -m644 ${srcdir}/archlinux.conf.d.mythbackend "${pkgdir}/etc/conf.d/mythbackend"
  # install contrib files
  cp -a contrib/$i ${pkgdir}/usr/share/mythtv
  # install database structure
  cd database
  cp -a mc.sql ${pkgdir}/usr/share/mythtv
}