# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=gamebookmaker
pkgver=2.11
pkgrel=1
pkgdesc="Design gamebooks with this editor."
arch=(i686 x86_64)
url="http://redohome.hd.free.fr/gameBooks/"
license=('CeCILL')
depends=('pygtk' 'pydot' 'pyparsing' 'odfpy')
#groups=()
source=(http://redohome.hd.free.fr/gameBooks/files/gamebookMaker_2-11.tar.bz2)
md5sums=('cf82a1c0105e10939bee7f8cc6409f78')


build() {
  cd $srcdir/gamebookMaker
  
	mkdir -p $pkgdir/usr/share/$pkgname
	mkdir -p $pkgdir/usr/bin
	cp -fr $srcdir/gamebookMaker/* $pkgdir/usr/share/$pkgname
	
	# shortcut to /usr/bin/
	
	echo "cd /usr/share/gamebookmaker/
python gamebookMaker" > $pkgdir/usr/bin/$pkgname
  	chmod +x $pkgdir/usr/bin/$pkgname
  
	
	#desktop icons
	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/applications

	cp $srcdir/gamebookMaker/icones/gamebookMaker.png $pkgdir/usr/share/pixmaps/$pkgname.png
	
	install -D -m644 $srcdir/../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	
}
