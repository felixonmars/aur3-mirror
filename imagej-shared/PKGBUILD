# Contributor: Giulio Guzzinati <skarn86junk@gmail.com>
# Contributor: Paolo Herms
pkgname=imagej-shared
pkgver=144
pkgrel=1
pkgdesc="Image manipulation software for scientists"
arch=(any)
url="http://rsbweb.nih.gov/ij/index.html"
license=(custom)
depends=(java-runtime sh)
optdepends=(java-environemnt)
provides=(imagej)
conflicts=(imagej)
source=(http://rsbweb.nih.gov/ij/download/zips/ij$pkgver.zip
	imagej
	imagej.desktop
	microscope.xpm
	Disclaimer)

build() {
    cd "$srcdir"/ImageJ
    rm -rf ImageJ.exe ImageJ.app run
    mkdir -p "$pkgdir/usr/share/java/imagej"
    mv ij.jar "$pkgdir"/usr/share/java/imagej
    cd ..
    mv ImageJ "$pkgdir"/usr/share/imagej

    find "$pkgdir/" -type d -exec chmod 755 {} \; -o -exec chmod 644 {} \;

    install -D -m 755 imagej \
	$pkgdir/usr/bin/imagej || return 1
    install -D -m 644 imagej.desktop \
	$pkgdir/usr/share/applications/imagej.desktop || return 1
    install -D -m 644 microscope.xpm \
	$pkgdir/usr/share/pixmaps/microscope.xpm || return 1
    install -D -m 644 Disclaimer \
	$pkgdir/usr/share/licenses/$pkgname/Disclaimer || return 1
}

md5sums=('21df91aa67053f19c19b31a1bb2955db'
         '9a2f06b501484048766426c4d26c6793'
         '9d60878b6adad0e1895ce875bf299147'
         'e7a7cef1b44ad3a8752ba63885fd88fb'
         'bc876de4f487c0343cd1652438b8ffa3')
