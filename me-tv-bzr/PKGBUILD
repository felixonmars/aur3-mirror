#Maintainer: Christoph Seitz <seitz.christop@gmail.com>
#Previous Maintainer: Gianluca Boiano (aka M0Rf30)

pkgname=me-tv-bzr
pkgver=49
pkgrel=3
pkgdesc="A digital television (DVB) viewer for GNOME."
arch=('i686' 'x86_64')
url="https://launchpad.net/me-tv"
license=('GPL')
depends=('gtkmm' 'gconfmm' 'libxml++' 'libunique' 'vlc' 'gstreamer0.10-base')
optdepends=('linuxtv-dvb-apps: dvb tools'
'w_scan: generation of channels.conf')
makedepends=('intltool' 'gnome-common' 'bzr')
provides=('me-tv')
conflicts=('me-tv')
install='me-tv-bzr.install'
options=('!emptydirs')
_bzrtrunk="lp:me-tv"
_bzrmod=development

build() {
  cd "${srcdir}"
  
  msg "Connecting to the server..."
  if [ ! -d ./${_bzrmod} ]; then
    bzr co ${_bzrtrunk} ${_bzrmod}
  else
    bzr up ${_bzrmod}
  fi
  
  cd "${srcdir}/${_bzrmod}"
  
  # Missing unistd.h includes :| https://bugs.launchpad.net/me-tv/+bug/1020690
  for file in common/common.cc server/thread.cc; do
      sed -i '1 i\
          #include <unistd.h>' $file
  done
  
  #fix aclocale
  sed -i '/AM_PROG_CC_STDC/d' configure.ac
  
  mkdir -p "${srcdir}/${_bzrmod}-build"
  cd "${srcdir}/${_bzrmod}-build/"
  
  msg "Starting make..."
  NOCONFIGURE=1 ../"$_bzrmod"/autogen.sh
  ../"$_bzrmod"/configure CXXFLAGS="$CXXFLAGS -D__KERNEL_STRICT_NAMES" --prefix=/usr
    
  make
}
 
package() {     
  cd "${srcdir}/${_bzrmod}-build"

  make -j1 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" \
  --domain me-tv "${pkgdir}/usr/etc/gconf/schemas/${pkgname}.schemas"

  rm -rf "${pkgdir}/usr/etc/"
}

