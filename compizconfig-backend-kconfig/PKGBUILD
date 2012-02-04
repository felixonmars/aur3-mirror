# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: kasa <biuta.jr@gmail.com>

pkgname=compizconfig-backend-kconfig
pkgver=0.8.4
pkgrel=1
pkgdesc="Compizconfig backend for kconfig"
arch=('i686' 'x86_64')
url="http://opencompositing.org"
license=('GPL')
depends=('libcompizconfig' 'kdelibs3')
makedepends=('intltool' 'pkgconfig')
groups=('compiz-fusion-kde' 'compiz-fusion')
options=('!libtool')
source=(http://releases.compiz-fusion.org/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('a96a30aba5e5faf7aa7db440fe4891ca')

build() {
  . /etc/profile.d/kde3.sh
  . /etc/profile.d/qt3.sh
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure \
    --prefix=/opt/kde \
    --without-arts \
    --with-kde-includes=/opt/kde/includes 
                
  make
  make DESTDIR=${pkgdir} install
}
