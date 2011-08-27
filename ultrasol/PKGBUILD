# Contributor: Tillman Coghill a.k.a Liberion <liberion@gmail.com>

pkgname=ultrasol
pkgver=1.0.2
pkgrel=3
pkgdesc="A solitaire game like pysol."
arch=('i686' 'x86_64')
url="http://abe.sourceforge.net"
license=('GPL')
depends=('python' 'tcl' 'tk')
makedepends=('python' 'tcl' 'tk')
source=(http://www.ibiblio.org/pub/linux/games/solitaires/$pkgname-$pkgver.tar.gz \
        $pkgname.example $pkgname.desktop $pkgname.png $pkgname-encoding.diff.gz)

build() {
	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
        tar xzvf ultrasol-1.0.2.tar.gz
        zcat $srcdir/ultrasol-encoding.diff.gz | patch -p0 --verbose || exit 1
	mv $srcdir/ultrasol  $pkgdir/usr/share/ultrasol
	install -m644 $srcdir/ultrasol.png $pkgdir/usr/share/pixmaps/
	install -m644 $srcdir/ultrasol.desktop $pkgdir/usr/share/applications/
        install -m755 $srcdir/ultrasol.example $pkgdir/usr/bin/ultrasol
}


md5sums=('07b0a1900dbe228a3d8549e29631924d'
         '49772d7255ab2061a0887973720e642b'
         'e7669124f8f5bd0958a7af5ce7ab0751'
         '61eb58510b45ad919ee3d07035b87d22'
         '492039e116998bc957d537a6b6af4c46')
