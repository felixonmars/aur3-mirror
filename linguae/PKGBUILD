#Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=linguae
pkgver=0.15
pkgrel=1
pkgdesc="Dictionary manager supporting most of usual formats."
arch=(any)
url="http://linguae.stalikez.info/"
license=('CeCILL')
depends=('python' 'tk')
optdepends=('snack' 'python-imaging')
source=(http://linguae.stalikez.info/dwnld/linguae_0_15.zip)

md5sums=('1ceb8239a661ecfe55ad67031455adaf')

build() {

	
  cd $srcdir
	
	mkdir -p $pkgdir/usr/share/$pkgname
	mkdir -p $pkgdir/usr/bin
	
	cp -fr $srcdir/* $pkgdir/usr/share/$pkgname

	
	#starting script
	echo "python2 /usr/share/linguae/linguae.pyw
" > $pkgdir/usr/bin/$pkgname

	chmod +x $pkgdir/usr/bin/$pkgname
	
	#desktop icons
	mkdir -p $pkgdir/usr/share/pixmaps
	#cp $srcdir/../pkgname_logo.png $pkgdir/usr/share/pixmaps/$pkgname.png
	
	install -D -m644 $srcdir/../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

}
