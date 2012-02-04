pkgname=bluepad
pkgver=0.4
pkgrel=3
pkgdesc="BluePad turns your cell phone into a remote bluetooth controller with which you can control your computer. It is free software released under GNU GPL license."
license="GPL2"
arch=('i686' 'x86_64')
url="http://www.valeriovalerio.org/bluepad/"
depends=('python-pybluez' 'python-notify' 'gksu')
source=('http://downloads.sourceforge.net/bluepad/bluepad_0.4_complete_project_sources.tar.gz?use_mirror=osdn' 'simple.patch')

md5sums=('d68859e9094a99bcbe7185e0b794813b'
         '73cb79950d644b8580ec65289289b5eb')

build() {
	cd $srcdir
	install -d $pkgdir/usr/share/bluepad
	cp -R bluepad_0.4_complete_project_sources/bluepad_pc/* $pkgdir/usr/share/bluepad
	patch -p0  $pkgdir/usr/share/bluepad/bluepad < $startdir/simple.patch
	install -d $pkgdir/usr/bin
	cd $pkgdir/usr/bin
	ln -s ../share/bluepad/bluepad bluepad
	install -D $pkgdir/usr/share/bluepad/bluepad.desktop $pkgdir/usr/share/applications/bluepad.desktop
}

