# Contributor: Snorre Jensen snojen@gmail.com

pkgname=xmms-crossfade
pkgver=0.3.14
pkgrel=1
pkgdesc="Crossfade/ gapless output plugin for XMMS"
arch=(i686 x86_64)
url="http://www.eisenlohr.org/xmms-crossfade/"
license=('GPL')
depends=('xmms' 'libsamplerate')
groups=('xmms-plugins' 'xmms-io-plugins')
makedepends=('glib>=1.2.7' 'gtk>=1.2.7')
options=('!libtool')
source=(http://www.eisenlohr.org/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('026c52544c7f3193d384288c9f8296aa')

build() {
   cd ${pkgname}-${pkgver}
   ./configure
   make
}

package() {
   cd ${pkgname}-${pkgver}
   make DESTDIR="${pkgdir}" install || return 1
}



