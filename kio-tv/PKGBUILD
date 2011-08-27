#
# Contributor: Emanuele Rampichini <emanuele.rampichini@gmail.com>
#

pkgname=kio-tv
pkgver=0.1
pkgrel=1
pkgdesc="The TV KIO slave is a way of nicely displaying your media collection."
url="http://kde-apps.org/content/show.php/TV+Kio+Slave?content=64818"
license=('GPL')
depends=('kdelibs')
arch=('i686' 'x86_64')
options=('libtool')

source=(http://sharpley.org.uk/~david/tvkio/TvKio.tar.gz)
md5sums=('c3f9b0d08d32291f86cbfc0e150acb1d')

build() {
  cd $startdir/src/TvKio
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}
