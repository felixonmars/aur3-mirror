# $Id$
# Maintainer: Mladen Pejaković <pejakm@gmail.com>
# Contributor: Anke Boersma <abveritas@chakra-project.org>

pkgname=qtwebkit-plugins
_commit=0831bb2
pkgver=0.1.${_commit}
pkgrel=1
pkgdesc="Set of QtWebKit platform plugins for the latest QtWebKit: spellcheck and notifications"
url="https://github.com/QupZilla/qtwebkit-plugins"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qtwebkit>=2.3' 'hunspell')
categories=('network') 
source=("https://github.com/QupZilla/qtwebkit-plugins/tarball/master/QupZilla-qtwebkit-plugins-${pkgver}.tar.gz")
md5sums=('4633620b7be9f53c455ccca147a4e3da')

build() {
   cd "${srcdir}/QupZilla-qtwebkit-plugins-${_commit}/"
   qmake 
   make
}

package() {
   cd "${srcdir}/QupZilla-qtwebkit-plugins-${_commit}/"
  
   make INSTALL_ROOT=$pkgdir install
}