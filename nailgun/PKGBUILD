# Maintainer: Artyom Olshevskiy <siasiamail@gmail.com>
pkgname=nailgun
pkgver=0.9.2
pkgrel=1
pkgdesc="A client, protocol, and server for running Java programs from the command line"
arch=('i686' 'x86_64')
url="http://www.martiansoftware.com/nailgun/"
license=('APACHE')
depends=(java-runtime)
makedepends=(maven)
_git_commit_id=71c65df529cfaade612669302a00f0706a42e76a
source=(https://github.com/martylamb/nailgun/archive/$_git_commit_id.tar.gz ng-server)
md5sums=('eaa61cfc54a600b74ea4552663b629c4'
         '330f719a402187425f3f789bd3ee28f1')
noextract=()

build() {
  cd "$srcdir/$pkgname-$_git_commit_id"
  make
	mvn package
}

package() {
	cd "$srcdir/$pkgname-$_git_commit_id"
	mkdir -p $pkgdir/usr/bin
	cp ng $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/java/$pkgname
	cp nailgun-server/target/nailgun-server-${pkgver}-SNAPSHOT.jar $pkgdir/usr/share/java/$pkgname/${pkgname}-${pkgver}.jar
	cd $srcdir
	sed -e "s/{pkgname}/${pkgname}/g" -e "s/{pkgver}/${pkgver}/g" ng-server > $pkgdir/usr/bin/ng-server
	chmod +x $pkgdir/usr/bin/ng-server	
}
