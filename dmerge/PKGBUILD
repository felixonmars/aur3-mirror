# Contributor: Mark Smith <markzzzsmith@yahoo.com.au>
pkgname=dmerge
pkgver=0.0
pkgrel=5
pkgdesc="Find duplicate files, and merge them using file system hardlinks, saving disk space"
arch=('i686' 'x86_64')
url="http://www.fluxsmith.com/cgi-bin/twiki/view/Jonathan/DMerge"
license="custom:MIT"
makedepends=('glibc' 'gcc')
depends=('glibc')
install=dmerge.install
source=(http://www.fluxsmith.com/twiki/pub/Jonathan/DMerge/dmerge.cpp
	dmerge.install)
md5sums=('e6ab6c5b630cc3bff2323d2cfc44fccd'
	 'bf1bf0d67242ac6f7dd1ffeaa6841ee4')

build() {

  g++ $CXXFLAGS dmerge.cpp -o dmerge -lstdc++

  install -D -m755 dmerge $startdir/pkg/usr/bin/dmerge
  install -D -m444 dmerge.cpp $startdir/pkg/usr/share/licenses/$pkgname/LICENSE

}
