# Contributor: Lisa Denia <eiffel56@gmail.com>
pkgname=xulrunner-linden-cvs
pkgver=20090818
_linden_ver=08172009
pkgrel=1
pkgdesc="Mozilla Runtime Environment with Linden Labs patches"
arch=("i686" "x86_64")
url="http://wiki.secondlife.com/wiki/LLMozLib2"
license=('GPL' 'MPL' 'LGPL')
groups=()
depends=("gtk2>=2.16.5"  "gcc-libs>=4.4.1"  "libidl2>=0.8.13" "nss>=3.12.3.1"  
         "libxt"  "hunspell>=1.2.8" "startup-notification>=0.10"  "mime-types"  "dbus-glib>=0.80  "
         "alsa-lib>=1.0.20")
makedepends=('cvs' 'make')
source=("gcc44fix.patch" "linden-${_linden_ver}.patch" "mozconfig")
md5sums=('6c6ba1180c19b4d3eec33abb84a50736'
         '07dac887e4436d7133bc18e326c95140'
         '8cfd19443a61c6b7c658a6323220037c')

_cvsroot=":pserver:anonymous@cvs-mirror.mozilla.org:/cvsroot"
_cvsmod="mozilla"
_cvsrev="THUNDERBIRD_2_0_0_21_RELEASE"


build() {
  cd "$srcdir"

  msg "Connecting to $_cvsroot CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs update -d
    make -f client.mk real_fast-update MOZ_CO_PROJECT=xulrunner
  else
    cvs -d $_cvsroot co -r ${_cvsrev} mozilla/client.mk
    cd $_cvsmod
    make -f client.mk checkout MOZ_CO_PROJECT=xulrunner
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"


  #
  # BUILD HERE
  #

  cp ${srcdir}/mozconfig .mozconfig || return 1
  patch -p0 -i ${srcdir}/linden-${_linden_ver}.patch || return 1
  patch -p2 -i ${srcdir}/gcc44fix.patch || return 1

  make -f client.mk build || return 1
  make -f client.mk DESTDIR=${pkgdir}/ install || return 1

  # Manually copy dist/lib/libprofdirserviceprovider_s.a, SecondLife needs it
  cp dist/lib/libprofdirserviceprovider_s.a ${pkgdir}/opt/xulrunner-linden/lib/xulrunner-1.8.1.21/
}
