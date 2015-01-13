# Maintainer: Christoph Wiechert <wio@psitrax.de>
# Contributor: Peter Wu <peter@lekensteyn.nl>
pkgname=sflphone-kde
pkgver=1.4.1
pkgrel=2
pkgdesc="SIP/IAX2 softphone"
url="http://www.sflphone.org"
arch=('x86_64' 'i686')
license=('GPL3')
depends=(## daemon dependencies
         'libyaml'
         'libpulse'
         #'jack'
         'libsamplerate' 'libsndfile'
         'ccrtp'
         # 'ffmpeg' 'libsystemd' # for video
         #'gnutls'
         #'libzrtpcpp' # libzrtpcpp 4.3.1 is broken in many aspects
         'dbus-c++' 'expat' 'pcre'
         'gsm' 'speex'
         #'ilbc' 'opus'

         ## kde build dependencies
         'kdelibs'
         'kdepimlibs'
         )
makedepends=('autoconf' 'cmake' 'boost' 'automoc4')
conflicts=('sflphone')
source=("https://projects.savoirfairelinux.com/attachments/download/14805/sflphone-${pkgver}.tar.gz"
        'siptransport.patch'
        '0001-daemon-fix-build-with-newer-libzrtpcpp.patch')
md5sums=('2092fb6ebcdfdf4f0f45da4738b1be8d'
         'fd0d2570647ac8f4c52a475c617734c4'
         '706b7ffc530b36b2f02adab38dd1a7d7')
install="${pkgname}.install"

# true/false to enable/disable zrtp support.
# BROKEN with at least libzrtpcpp 4.3.1 and sflphone 1.4.1
# (see prepare for one incomplete patch to the 4.3.1).
# The official GNU libzrtpcpp (2.3.4) may still work though (untested).
_enable_zrtp=false
# true/false to enable/disable video support
_enable_video=false

if $_enable_zrtp; then
    # for daemon, but needs additional patching
    depends+=('libzrtpcpp')
fi

if $_enable_video; then
    # for daemon, libsystemd is needed for udev
    depends+=('ffmpeg' 'libsystemd')
    # for kde client, kde/src/widgets/videowidget3.cpp
    depends+=('glut')
fi

# TODO
# sflphone-kde E: Symlink (usr/share/doc/kde/html/en/sflphone-client-kde/common) points to non-existing /usr/share/doc/kde/html/en/common
# happens because the html dir should be in UPPERCASE. Related files:
# kde/doc/CMakeLists.txt
# /usr/share/apps/cmake/modules/KDE4Macros.cmake
#
# zrtp support is broken (due to an incompatible libzrtpcpp)
# https://projects.savoirfairelinux.com/issues/51388

prepare() {
  cd "${srcdir}/sflphone-${pkgver}"

  # Fix TLS, from:
  # https://projects.savoirfairelinux.com/projects/sflphone/repository/revisions/9bba71a35618c3053b05e4a0443e60911d462b56/diff/daemon/src/sip/siptransport.cpp?format=diff
  patch -Np1 -i "${srcdir}/siptransport.patch"

  if $_enable_zrtp; then
    # Fix ZRTP build failure, you first need to patch libzrtpcpp with
    # https://github.com/wernerd/ZRTPCPP/pull/17
    patch -Np1 -i "${srcdir}/0001-daemon-fix-build-with-newer-libzrtpcpp.patch"
    # next there is https://github.com/wernerd/ZRTPCPP/issues/21
    # too much work just to get zrtp working, I quit.
  fi

  # Prevent failure due to _BSD_SOURCE warnings from new GCC
  sed '/^ *-Werror$/d' -i kde/src/CMakeLists.txt
}

build() {

## pjsip
  msg "Compile PJSIP"
  cd "${srcdir}/sflphone-${pkgver}/daemon/libs"
  ./compile_pjsip.sh

## daemon
  msg "Compile the Daemon"
  cd "${srcdir}/sflphone-${pkgver}/daemon"
  ./autogen.sh
  # zrtp leads to compile error
  ./configure --prefix=/usr \
    $($_enable_zrtp || echo --without-zrtp) \
    $($_enable_video || echo --disable-video)
  # Enabled by default, disable with:
  # --disable-video
  # --without-zrtp              # depends on libzrtpcpp
  # --without-instant_messaging # depends on expat
  # --without-sdes              # depends on pcre
  # --without-gsm               # depends on gsm (codec)
  # --without-speex             # depends on speex (codec)
  # --without-speexdsp          # depends on speex (for noise suppression)
  # --without-alsa              # depends on alsa-lib
  # --without-pulse             # depends on libpulse
  #
  # Disabled by default, enable with:
  # --with-tls                  # depends on gnutls
  #
  # Optional features (auto-detected), disable with:
  # --without-libilbc           # depends on ilbc (in AUR)
  # --without-opus              # depends on opus
  # --without-jack              # depends on jack
  make

## KDE client
  msg "Compile the KDE Client"
  cd "${srcdir}/sflphone-${pkgver}/kde"
  mkdir -p build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_VIDEO=${_enable_video}
  # In theory one could disable the dependency on akonadi with:
  # -DCMAKE_DISABLE_FIND_PACKAGE_Akonadi=1
  # but the code really depends on it.
  #
  # -DENABLE_VIDEO must be "true" or "false". Due to the way the CMakeLists.txt
  # is written, the usual "0", "off", etc. do not work (at least in 1.4.1).
  #
  # the cmake file tries to link to these libraries (if found):
  # cmake files will link to these libraries (package name):
  # kdeui, kio (kdelibs)
  # akonadi-kde, akonadi-kmime, akonadi-contact (kdepimlibs)
  # X11 (libx11)
  # GL (mesa, only if video is enabled)
  make
}

package() {

## daemon
  cd "${srcdir}/sflphone-${pkgver}/daemon"
  make DESTDIR="${pkgdir}" install

## KDE client
  cd "${srcdir}/sflphone-${pkgver}/kde/build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
