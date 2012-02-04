# Contributor: Charles Gaël DJEDAI <charlesgael.djedai@orange.fr>
pkgname=ade-programme-gtk
pkgdesc="Interface pour afficher le planning de ADE"
pkgver=1.0
pkgrel=5
arch=('any')
url='http://charlesgael.free.fr/'
license=('GPL')
depends=('python<2.7' 'python>=2.6' 'pygtk' 'ade-programme-utils')
source=('Launcher' 'ade-programme-gtk.desktop' 'ade-programme-gtk.png' 'adeProgrammeGtk.py')

build() {
	cd $srcdir 
	
	# Install the launcher
	install -D -m 755 $srcdir/Launcher \
	$pkgdir/usr/bin/ade-programme-gtk
	
	# Install the scripts
	install -D -m 755 $srcdir/adeProgrammeGtk.py \
		$pkgdir/usr/share/ade-programme/adeProgrammeGtk.py
	
	python -c "import py_compile; py_compile.compile('adeProgrammeGtk.py')" || return 1
	
	install -D -m 755 $srcdir/adeProgrammeGtk.pyc \
		$pkgdir/usr/share/ade-programme/adeProgrammeGtk.pyc
	
	# Install Icon
	install -D -m 644 $srcdir/ade-programme-gtk.png \
		$pkgdir/usr/share/pixmaps/ade-programme-gtk.png
	
	# Install Launcher
	install -D -m 644 $srcdir/ade-programme-gtk.desktop \
		$pkgdir/usr/share/applications/ade-programme-gtk.desktop
}
md5sums=('8ded377ff5d568a033ae2483f0760a12'
         '2e181799edbc834bf23a32e175414266'
         '95e065eaac289e7a8cca6bc06e6153ac'
         '8f70ac8a3caf74bf462ba4ac5febef93')
