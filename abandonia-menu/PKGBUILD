# Contributor: Jens Staal <staal1978@gmail.com>

pkgname="abandonia-menu"
pkgver="0"
pkgrel=1
pkgdesc="A desktop menu class to organize all games from Abandonia"
url='http://www.abandonia.com/'
arch=('any')
license=('custom-freeware' 'Abandonware')
source=('abandonia.png')
md5sums=('cddb27295d89b9fe00375e43449755c2')


build() {
	mkdir -p -m755 "$pkgdir/opt/" 
	mkdir -p -m755 "$pkgdir/opt/abandonia" 
	mkdir -p -m755 "$pkgdir/opt/abandonia/menu" 

	cp $srcdir/abandonia.png $pkgdir/opt/abandonia/menu/
	_pkgabbrev='menu'
	_icon='abandonia.png'

	# Automatic generation of a .directory file

	mkdir -p -m644 "$pkgdir/usr/share/" 
	mkdir -p -m644 "$pkgdir/usr/share/desktop-directories/" 

	printf "[Desktop Entry]
Name=Abandonia
Comment=$pkgdesc
Icon=/opt/abandonia/$_pkgabbrev/$_icon
Type=Directory
" >> /$pkgdir/usr/share/desktop-directories/Abandonia.directory
} 
