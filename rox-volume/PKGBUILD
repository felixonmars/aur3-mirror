# Contributor: Pablo Lezaeta <prflr88 @ gmail.com>

pkgname=rox-volume
_pkgname=Volume
pkgver=0.4.14122008
pkgrel=1
group=('rox-desktop')
pkgdesc="Volume applet for Rox desktop"
arch=('any')
url="http://roscidus.com/desktop/Software/Audio_Video/Volume"
license=('GPL')
depends=(rox-lib python-pyalsaaudio python2 gtk2)
source=(http://manualinux.heliohost.org/archivos/rox/Volume-git-ML.tar.bz2
	arch.patch)


build() {
	cd "$srcdir/$_pkgname"
	patch -Np1 -i ../arch.patch
	mkdir -p "$pkgdir/usr/share/$_pkgname"
	mkdir -p "$pkgdir/usr/bin"
	cp -R * "$pkgdir/usr/share/$_pkgname"
	cp .DirIcon "$pkgdir/usr/share/$_pkgname"
	cd "$pkgdir/usr/share/$_pkgname"
	echo "#!/usr/bin/env bash" > $pkgdir/usr/bin/$pkgname
	echo "sh /usr/share/$pkgname/AppRun" >> $pkgdir/usr/bin/$pkgname
	chmod +x $pkgdir/usr/bin/$pkgname
}

md5sums=('0545309b09c7eac5e0fa41d71abecf92'
         'dda0e59c3fa0bfcdfcc6635e570bc039') 
