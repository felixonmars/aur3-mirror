pkgname=loemu
pkgver=0.3.1
pkgrel=2
pkgdesc="a free application that provides a simple front end for various game emulators like xmame, sdlmame, snes9x and zsnes"
arch=('any')		# se o program é em python então ele funciona tanto em i686 e em x86_64 e outros então... 'any'
url='http://loemu.pegueroles.com/'
license=('GPL')
depends=('python2>=2.4' 'libxml2' 'libxslt' 'glade')
source=('http://loemu.pegueroles.com/dists/loemu-0.3.1.tar.gz' 'loemu.desktop')
md5sums=('c2ac4dc230511d48761c0781f50aa1a1' '2c80893ff8717e6c3333eb051a3ef3a4')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	python2 setup.py install --root="$pkgdir/" --optimize=1

	install -d $pkgdir/usr/share/applications
	cp ${srcdir}/loemu.desktop $pkgdir/usr/share/applications/loemu.desktop
}

# vim:set ts=2 sw=2 et:
