# Contributor: Aliaksandr Stelmachonak <mail.avatar at gmail dot com>

pkgname=pythonmachine
pkgver=0.26.4
_release=2
pkgrel=2
pkgdesc="A Python/Pygtk development environment"
arch=('i686' 'x86_64')
url="http://pythonmachine.sourceforge.net/"
license=('GPL')
depends=('python>=2.5' 'pygtk>=2.12' 'glade>=2.12' 'pygtksourceview>=1.1.0' 'libgnomeprintui'
				'libbonobo>=2.22.0' 'gettext>=0.17' 'gnome-vfs>=2.22.0' 'gnome-python>=2.22.0'
				'gnome-python-desktop>=2.22.0'	'gnome-python-extras>=2.22.0' 'tar>=1.19-3' 'vte' 'gdl')
source=( http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}-${pkgrel}/${pkgname}_${pkgver}-${_release}.tar.gz )
md5sums=('5d403a3662cf338e3b90032a1dd041f6')

build() {
	cd $srcdir/${pkgname}_${pkgver}-${_release}
	# perform installation
	python setup.py install --root=${pkgdir} || return 1
	# fix users permissions  
	chmod -R +r $pkgdir/usr/*
	# install icon file
	install -Dm644 $pkgdir/usr/share/pythonmachine/pixs/pythonmachine.png \
		$pkgdir/usr/share/pixmaps/pythonmachine.png
}
