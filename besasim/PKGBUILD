# Maintainer: Vineet Tiruvadi <virati@gmail.com>
pkgname=besasim
pkgver=1.0
pkgrel=2
pkgdesc="BesaSimulator for EEG Source Simulation"
arch=('x86_64')
url="http://www.besa.de/products/besa_simulator/"
license=('Proprietary')
source=(BESA_Simulator_1.0_June_2013_Setup_linux_x64.deb)
noextract=(BESA_Simulator_1.0_June_2013_Setup_linux_x64)
md5sums=(b9320294aa289cc276f9c4d11f9fa49e)

prepare() {
	cd "$srcdir"
	ar vx ${source}
	tar xzf "$srcdir/data.tar.gz"
}

package() {
	cd "$srcdir/"
	cp -r "$srcdir/opt" "$pkgdir"
	cp -r "$srcdir/usr" "$pkgdir"
	cp -r "$srcdir/var" "$pkgdir"

	mkdir "$pkgdir/bin"
	ln -s "/opt/BESA/besasimulator/BesaSimulator_linux_x64" "$pkgdir/bin/besasim"
}
