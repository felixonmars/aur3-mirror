# $Id$
# Maintainer: 
# This is no longer needed as it is now included with the claws-mail-extra-plugins
# Orphaned 

# Thanks for the patches gborzi 
# Thanks for the 04 2012 cvs snapshot snuo

pkgname=claws-pdf-viewer
_srcname=pdf_viewer
pkgver=0.9.5
pkgrel=1
pkgdesc="Claws Mail PDF viewer plugin."
url="http://www.claws-mail.org/downloads/plugins/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('claws-mail>=3.8.0' 'poppler-glib>=0.18.4' 'ghostscript>=9.05')
options=('!libtool')
source=(${_srcname}-cvs-04-2012.tar.gz) 
sha256sums=('409fd05b59974ed243fc812bbf3e15204bdf51818bdc1ebec2ea9bad31209f52')

build() {
	cd "${srcdir}/${_srcname}"
  ./autogen.sh --prefix=/usr \
    --enable-static=no
	make
}

package() {
  cd "${srcdir}/${_srcname}"
  make DESTDIR="${pkgdir}" install
}

# vim: set ts=2 sw=2 et:
