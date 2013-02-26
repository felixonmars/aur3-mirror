# $Id: PKGBUILD 55878 2011-09-24 16:48:22Z stephane $
#Maintainer: Stéphane Gaudreault <stephane@archlinux.org>
#Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
#Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=clementine-rc
pkgver=1.1.1
pkgrel=2
pkgdesc="A music player and library organizer. Version 1.0.0rc1 for those that want to test the current RC version early. PKGBUILD may contain more dependencies than necessary."
url="http://www.clementine-player.org/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gstreamer0.10' 'taglib' 'glew' 'liblastfm' 'libgpod' 'libmtp' 'libplist' 'hicolor-icon-theme' 'qt' 'libimobiledevice' 'libspotify' 'libindicate-qt' 'qjson')
makedepends=('cmake' 'boost')
optdepends=('gstreamer0.10-base-plugins: for more open formats'
            'gstreamer0.10-good-plugins: for use with "Good" plugin libraries'
            'gstreamer0.10-bad-plugins: for use with "Bad" plugin libraries'
            'gstreamer0.10-ugly-plugins: for use with "Ugly" plugin libraries')
source=(http://clementine-player.googlecode.com/files/clementine-${pkgver}.tar.gz)
md5sums=('28e4afb822388bd337a761db8f86febf')
install=clementine.install

build() {
   cd "${srcdir}/clementine-${pkgver}"
   cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DSTATIC_SQLITE=0 -DENABLE_GIO=OFF
   make
}

package() {
   cd "${srcdir}/clementine-${pkgver}"
   make DESTDIR="${pkgdir}" install
}
