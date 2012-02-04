# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=geoid
pkgver=1.0
pkgrel=4
pkgdesc="Geodetic computer for amateur radio use"
arch=('i686' 'x86_64')
url="http://www.w1hkj.com/#Geoid"
license=('GPL')
depends=('fltk')
source=(http://w1hkj.com/LinuxApps/fl_${pkgname}.src.tar.gz $pkgname.desktop x${pkgname} cstdio.patch)

build() {
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/{applications,$pkgname,pixmaps}

	cd $srcdir

	patch -p1 < cstdio.patch
	install -m755 x${pkgname} $pkgdir/usr/bin
	install -m644 $pkgname.desktop $pkgdir/usr/share/applications

	cd fl_${pkgname}

	make all || return 1

	install -m755 $pkgname $pkgdir/usr/bin
	install -m755 gridloc $pkgdir/usr/bin
	install -m644 country.pos $pkgdir/usr/share/$pkgname
	install -m644 $pkgname.png $pkgdir/usr/share/pixmaps
}
md5sums=('aa7c38cf149aca51259a4209a7fb49cd'
         '90ba524b3d004389297fc4e9e68e36bc'
         '3314b49269c8d37f5f3413f389c1ff51'
         '52488626a3d10f7558361ae639c3d47d')
sha256sums=('47af413f0d5fdf0bf1e66c96be7795f41fa5311cc3803b5bec5a5c6e63903430'
            '7390a34a2dcb773ab12f64f0513679125463f3d8c5f40ca73a02a171166e6069'
            'c6eaff93e72bfc468cf94cc4fca399569a52a5a341422a2e6f74c6c9182ec53f'
            '8c6edad749df129667bc6cba6dd72ba537a22b60d869b3656db14197ff0d394a')
