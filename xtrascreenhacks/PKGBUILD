# Maintainer: onexused <aursignup dot kyoo at xoxy dot net>

pkgname=xtrascreenhacks
pkgver=0.7
pkgrel=2
pkgdesc="A collection of display modes that are based on and intended to be run with the XScreensaver distribution."
url="http://home.comcast.net/~shegeek/xtrascreenhacks/"
license="MIT"
arch=('i686' 'x86_64')
depends=('xscreensaver' 'libgl')
makedepends=('make')
optdepends=('kdeartwork-kscreensaver' 'gnome-screensaver')
install=(xtrascreenhacks.install)
source=(http://home.comcast.net/~shegeek/xtrascreenhacks/${pkgname}-${pkgver}.tar.bz2
        'psychedelic.xml'
        'psychedelic-new-options.diff'
        'plasmamap.c'
        'plasmamap.h')
md5sums=('fbb4108fe4c80e634f11429f4ed0f5cc'
         '0818dfee57fa0dc33e34fbd42e02e5e0'
         'ba9d30f60b82180b050bbb796b4c9b62'
         '992b3a9cb9d78689e7d090dd130e991b'
         '5e6576f745059e27560fe01590132b4b')
sha1sums=('18c9d57a5175ee7178393f6876bc646fafb99043'
          'dea6a6cea35d1195c1d657f5e05d683c341fda37'
          '3de4f0006285a379b9c03e2963d1e2516394cdf1'
          'a58a1afd268873f4ecd9ffd4b07c7f9835609560'
          '48765f36224790fb33b20ce7df4a80a2a6634b52')

build() {
   cd "${srcdir}"/$pkgname-$pkgver
   cp "${srcdir}"/psychedelic.xml hacks/config/
   cp "${srcdir}"/plasmamap.h hacks/glx/
   cp "${srcdir}"/plasmamap.c hacks/glx/
   patch -p0 < "${srcdir}"/psychedelic-new-options.diff
   ./configure --with-hackdir="${pkgdir}"/usr/lib/xscreensaver \
         --with-configdir="${pkgdir}"/usr/share/xscreensaver/config \
         --prefix="${pkgdir}"/usr
   make 
   }

package() {
   cd "${srcdir}"/$pkgname-$pkgver
   DESTDIR="${pkgdir}" make install
   }
