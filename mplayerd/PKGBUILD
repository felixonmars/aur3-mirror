# Contributor: chochem <chochem@gmail.com>
# Thanks to: kumyco for supplying the patch (and build proceedings) - basically I just shrinkwrapped it.
pkgname=mplayerd
pkgver=0.1.16
pkgrel=2
pkgdesc="mplayerd is an mplayer daemon controlled via tcp/ip"
arch=(i686)
url="https://sourceforge.net/projects/mplayerd/"
license=('GPL')
depends=('mplayer')
makedepends=(gcc)
source=("http://downloads.sourceforge.net/sourceforge/mplayerd/${pkgname}-${pkgver}.tar.gz" 'mplayerd.patch') 
md5sums=('7e4e1a77ae42ead06365694ac1570404' 'deafcb1d7020799843dbf1276ef4a963')

build() {
  cd $srcdir/$pkgname-$pkgver/src  
  patch -p0 -i $srcdir/mplayerd.patch || return 1
  make && make DESTDIR=$pkgdir install || return 1
}
