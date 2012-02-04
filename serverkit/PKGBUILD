# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=serverkit
pkgver=1.1.1
pkgrel=1
pkgdesc="A SDK for building server programs on Linux."
arch=('i686')
url="http://serverkit.org/"
license=('custom:HPL')
depends=('confuse' 'libmysqlclient')
source=(http://serverkit.org/$pkgname-$pkgver.tar.gz COPYING)
noextract=()
md5sums=('e0ab4a763b9a82c901cc240d52335694' 'beee3595cda34aec190211c323d0775b')

                                                            
build() {
  cd $startdir/src/$pkgname-$pkgver/lib
  make || return 1                      
  install -d -m755  $startdir/pkg/usr/include
  install -m644 *.h $startdir/pkg/usr/include
  install -d -m755  $startdir/pkg/usr/lib
  install libserver.so libserver.a $startdir/pkg/usr/lib
    
  cd ..
  make || return 1
  install -D -m755 server $startdir/pkg/usr/sbin/server
  install -D ../COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING  
}
