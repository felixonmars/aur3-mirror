# Maintainer: Andreas Schnaiter <rc.poison@gmail.com>
pkgname=sql-power-architect
pkgver=1.0.7
pkgrel=1
pkgdesc="Data Modeling & Profiling Tool"
arch=('i686' 'x86_64')
url="http://code.google.com/p/power-architect/"
license=('GPL')
groups=()
depends=('java-runtime')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	http://power-architect.googlecode.com/files/SQL-Power-Architect-generic-jdbc-$pkgver.tar.gz
	sql-power-architect
	sql-power-architect.desktop
	sql-power-architect.png
)
noextract=()
md5sums=('afc3f2848c698300c371cd567e424553'
         '9e58c0334f8cbcccca0aabbfa9b685d4'
         'c3bbfcfc89ffde8b9ec322ee70a3d7ea'
         '256aaaf993d4f7e2a01316361bff2c56')

build() {
	cd "$srcdir"
	
	# install binary and menu item
	install -m 644 -D ${pkgname}.desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"
	install -m 644 -D ${pkgname}.png "$pkgdir/usr/share/pixmaps/${pkgname}.png"
	install -m 755 -D ${pkgname} "$pkgdir/usr/bin/${pkgname}"
	
	# copy app directory
	mkdir -p "$pkgdir/opt"
	cp -r architect-$pkgver "$pkgdir/opt/${pkgname}"
}

