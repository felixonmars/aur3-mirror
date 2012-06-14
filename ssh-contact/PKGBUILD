pkgname=ssh-contact
pkgver=0.7
pkgrel=1
pkgdesc="SSH over Telepathy Tube"
arch=('i686' 'x86_64')
url="http://telepathy.freedesktop.org/wiki/SSH-Contact"
groups=('telepathy')
license=('LGPL')
options=('!libtool')
depends=('telepathy-glib>=0.15.5' 'glib2>=2.28')
makedepends=('intltool' 'telepathy-glib>=0.15.5' 'glib2>=2.28')
source=("http://telepathy.freedesktop.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")


build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
    make DESTDIR=${pkgdir} install
}
md5sums=('2e98c1199c883980d4c8ef5fca4c5b70')
