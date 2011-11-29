# Maintainer: Julien Sopena (jsopena.archlinux@free.fr)
pkgname=greemote
pkgver=1.82
pkgrel=1
pkgdesc="Télécommande permettant de manipuler la Freebox HD directement depuis un ordinateur. Elle affiche le programme en cours ainsi que le programme à venir sur différentes chaînes."
arch=(any)              
url="http://sourceforge.net/projects/greemote/"
license=('GPL3')
depends=('python2' 'python2-xmltv' 'gstreamer0.10-python')   
makedepends=() 
provides=('greemote')   
conflicts=() 
replaces=()
backup=()
install=
source=("http://downloads.sourceforge.net/$pkgname/${pkgname}_$pkgver.tar.gz")
md5sums=(c9b51f45bbdd4842ee8a074022935566)

build()
{
	cd "$srcdir/src"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}

