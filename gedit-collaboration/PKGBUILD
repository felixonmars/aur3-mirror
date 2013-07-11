pkgname=gedit-collaboration
pkgver=3.6.1
pkgrel=1
pkgdesc="Gedit collaboration plugin provides support for collaborative editing in gedit."
arch=('i686' 'x86_64')
url="http://blogs.gnome.org/jessevdk/2010/02/14/47/"
license=('other')
provides=('gedit-collaboration')
conflicts=('gedit-collaboration')
depends=('libinfinity' 'gtk3' 'gedit' 'libxml2')
source=(ftp://ftp.gnome.org/pub/gnome/sources/${pkgname}/3.6/${pkgname}-${pkgver}.tar.xz)
sha256sums=('b6cfe444948bc5d9a070da2abd299c75d3ebeaf46641ac9ed27eac080bdb8ae9')
install='gschemas.install'

build(){
  cd $pkgname-$pkgver
  ./autogen.sh --prefix=/usr
  make || return 1
}

package(){
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install || return 1
}
