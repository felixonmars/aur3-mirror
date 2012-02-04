# Contributor: Jose Negron <josenj.arch@mailnull.com>
# Maintainer: Jose Negron <josenj.arch@mailnull.com>
pkgname=kexireportpart
pkgver=0.0.6
pkgrel=2
pkgdesc="A reporting component for Kexi"
url="http://www.piggz.co.uk/"
arch=('i686' 'x86_64')
license="GPL"
depends=('koffice') 
source=(http://www.piggz.co.uk/KexiReportPart_$pkgver.tar.bz2)
md5sums=('a7f6c838da5875ba413e8fe510e4d1d3')

build() {
   cd $startdir/src/KexiReportPart
   ./configure CFLAGS="$CFLAGS" CXXFLAGS="$CXXFLAGS" --prefix=`kde-config --prefix`
   make prefix=$startdir/pkg/usr install || return 1
}

