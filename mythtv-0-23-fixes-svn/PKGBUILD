# Maintainer: leprechau <ahurt@anbcs.com>
# Contributer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: <kleptophobiac@gmail.com>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=mythtv-0-23-fixes-svn
pkgver=24836
pkgrel=1
pkgdesc="A Homebrew PVR project"
arch=('i686' 'x86_64')
url="http://www.mythtv.org/"
license=('GPL')
depends=('mysql-clients' 'qt' 'lame' 'lirc-utils' 'ffmpeg' 'libxvmc' 'fribidi' 
         'perl-soap-lite' 'perl-date-manip' 'perl-xml-sax' 'perl-math-round' 
         'perl-net-upnp' 'perl-dbd-mysql' 'perl-time-hires' 'libavc1394' 'wget' 
         'libiec61883' 'mysql-python' 'mesa' 'libxinerama' 'libxrandr' 'yasm')
makedepends=('subversion')
optdepends=('xmltv: to download tv listings')
replaces=('mythtv-contrib' 'mythtv')
conflicts=('mythtv-contrib' 'mythtv')
provides=('mythtv')
backup=('etc/conf.d/mythbackend')
install=mythtv.install
source=('mythbackend' 'archlinux.conf.d.mythbackend')
md5sums=('feadcc9ad064d93d6dceab1efc0bd9ed'
         'bb8e4033d82428d827570fae9ba15e6a')

_svntrunk=http://code.mythtv.org/svn/branches/release-0-23-fixes/mythtv
_svnmod=${pkgname}

build() {
  cd "${srcdir}"

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up)
  else
    svn co ${_svntrunk} --config-dir ./ ${_svnmod}
  fi

  ARCH=${CARCH/_/-}

  msg "SVN checkout complete or server timeout"
  msg "Starting configure and make..."

  rm -rf "${srcdir}/${_svnmod}-build"
  cp -r "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"

  ./configure --prefix=/usr --cpu=${ARCH} \
              --enable-mmx \
              --enable-audio-oss \
              --enable-audio-alsa \
              --disable-audio-jack \
              --disable-audio-pulse \
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
  make all || return 1
  # basic install
  make INSTALL_ROOT="${pkgdir}" install || return 1
  install -D -m0755 ${srcdir}/mythbackend "${pkgdir}/etc/rc.d/mythbackend" || return 1
  # config file
  install -D -m644 ${srcdir}/archlinux.conf.d.mythbackend "${pkgdir}/etc/conf.d/mythbackend" || return 1
  # install contrib files
  cp -a contrib/$i ${pkgdir}/usr/share/mythtv
  # install database structure
  cd database
  cp -a mc.sql ${pkgdir}/usr/share/mythtv
}
