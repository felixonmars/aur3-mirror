# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=txtmap
pkgver=0.46
pkgrel=1
pkgdesc="Convert an interactive fiction transcript into an Inform 6 source."
arch=(i686 x86_64)
url="http://www.caad.es/baltasarq/prys/txtmap/txtmap_eng/txtmap.html"
license=('freeware')
groups=(inform)
source=(http://www.caad.es/baltasarq/download/${pkgname}-${pkgver}.zip)
md5sums=('18a3339c10861a4129594f5e6d6e9bad')


build() {
  	mkdir -p $pkgdir/usr/share/txtmap/examples
	mkdir -p $pkgdir/usr/bin

   	cp -fr $srcdir/${pkgname}-${pkgver}/ejemplos/* $pkgdir/usr/share/txtmap/examples
	
	cd $srcdir/${pkgname}-${pkgver}/src
	make || return 1
	
	cp $srcdir/${pkgname}-${pkgver}/src/txtmap $pkgdir/usr/bin
	

}


