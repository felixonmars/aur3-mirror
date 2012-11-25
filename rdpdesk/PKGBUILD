
pkgname=rdpdesk
pkgver=3.3.0
pkgrel=1
pkgdesc="A graphical frontend for remote desktop tools. Supports RDP, ICA and VNC"
arch=('i686' 'x86_64')
url="http://rdpdesk.com"
license=('GPL')
install=rdpdesk.install
depends=('libxaw' 'wxgtk' 'hicolor-icon-theme')
optdepends=('freerdp: RDP support'
            'rdesktop: RDP support' )
source=("http://rdpdesk.com/distribs/${pkgname}_${pkgver}.tar.bz2")
md5sums=('7c5ab6128184615e867b6868495e9c8b')

build() {
  cd ${pkgname}
  
  #add required LDFLAGS
  sed -i 's#./configure --prefix=/usr#LDFLAGS="-lX11 -lm -luuid" ./configure --prefix=/usr#' autogen.sh
  sh autogen.sh

  ##disable building of the (empty) doc dir 
  sed -i 's#SUBDIRS = src icons desktop po doc#SUBDIRS = src icons desktop po#' Makefile

  ##fix the "only <glib.h> can be included directly" issue
  sed -i  -e '/gspawn.h/d' src/proto/*.hpp
  make
}

package() { 
  cd ${pkgname}
  make DESTDIR="${pkgdir}/" install
}
