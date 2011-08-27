# Contributors: Mladen Pejaković <pejakm@gmail.com>

pkgname=kpws
pkgver=0.1
pkgrel=1
pkgdesc="KDE Personal WebServer is a utility made to ease file sharing in KDE"
url="http://kde-apps.org/content/show.php?content=120462"
license=('GPL')
arch=('i686' 'x86_64')
depends=('kdebase-workspace')
source=(http://kde-apps.org/CONTENT/content-files/120462-${pkgname}.tar.gz
        kpws.desktop)

md5sums=('696af10f593fab5dca3bd1916ff1bb9a'
         'dfb108bda22c87fb9ac27f9a6edcaa1e')

build() {
   cd $srcdir/$pkgname
   cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE
 
   make VERBOSE=1 || return 1
   make DESTDIR=$pkgdir install || return 1
   install -D -m 644 ${srcdir}/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop || return 1
}
