pkgname=galgas
pkgver=1.8.3
pkgrel=1
pkgdesc="compiler"
url="http://galgas.rts-software.org/"
arch=('i686')
#depends=('')
source=("http://galgas.rts-software.org/download/$pkgver/$pkgname-sources-lf.tar.bz2"
	"http://galgas.rts-software.org/download/$pkgver/libpm-lf.tar.bz2")
md5sums=('ca365ac15c4df2629252a95f8ac12c34'
	 '63c66115491774d75c9aeef016e3250d'
	 )
license="GPL"

build() {
  # Libpm #
  # just need to be extracted

  # Galgas #
  cd $startdir/src/$pkgname/makefile_unix
  #sed -e 's/\/usr\/local/..\/pkg/g' makefile > makefile2 #Don't install in /usr/local !
  make -f makefile || return 1
  #make install
  mkdir $pkgdir/usr/
  mkdir $pkgdir/usr/bin/
  cp galgas $pkgdir/usr/bin/galgas
}
        

