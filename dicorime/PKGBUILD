# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=dicorime
pkgver=2.1
pkgrel=1
pkgdesc="French rime dictionary"
arch=(i686 x86_64)
url="http://www.dicorime.fr/"
license=('gpl')
depends=('qt')
#makedepends=('')
#provides=()
conflicts=('dicorime-svn')
source=(http://www.dicorime.fr/download/${pkgname}-${pkgver}-src.tgz http://www.dicorime.fr/download/${pkgname}.db-${pkgver}.zip)

md5sums=('61cc495369a92168b9ebab6b6d244467'
         '834cfb46d5b6837b1e7ed525e0d40042')

build() {
	
   cd "$srcdir/${pkgname}-${pkgver}-src/src"
    qmake
	make
	make DESTDIR=$pkgdir install || return 1
	
	#deploy
	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/dicorime/base/
	
	cp $srcdir/${pkgname}-${pkgver}-src/bin/dicorime $pkgdir/usr/bin/
	cp -fr $srcdir/*.db $pkgdir/usr/share/dicorime/base/
	

 #desktop icons
	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/applications

	cp $srcdir/${pkgname}-${pkgver}-src/src/images/${pkgname}128.png $pkgdir/usr/share/pixmaps/$pkgname.png
	cp $srcdir/${pkgname}-${pkgver}-src/src/dicorime.svg $pkgdir/usr/share/dicorime/base/
	
	install -D -m644 $srcdir/../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

}


