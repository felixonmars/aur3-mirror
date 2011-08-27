# Contributor: Robin Vossen <robin@codeinject.org>

pkgname=systrace
pkgver=1.6f
pkgrel=1
pkgdesc="Systrace enforces system call policies for applications by constraining the application's access to the system."
arch=('i686' 'x86_64')
url="http://www.citi.umich.edu/u/provos/systrace/"
license=('bsd') 
#TODO CHECK
depends=('libevent')
#optdepends('gtk2: GUI')
source=("http://www.citi.umich.edu/u/provos/systrace/systrace-${pkgver}.tar.gz")
md5sums=('e6ddb35d7021a4ac7f965e844e252455')

build() 
{
   cd $startdir/src/$pkgname-${pkgver}
   ./configure --prefix=/usr/
   make || return 1
   make DESTDIR="$pkgdir/" install       
}
