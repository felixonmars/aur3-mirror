# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=alan
pkgver=3alpha6
pkgrel=1
pkgdesc="a tool for creating works of Interactive Fiction. It is easy to use."
arch=(i686 x86_64)
url="http://www.alanif.se"
license=('freeware')
depends=('glibc')
makedepends=('')
#provides=()
#conflicts=()
#replaces=()
#backup=()
groups=()
source=(http://ifiction.free.fr/fichiers/${pkgname}${pkgver}.tar.gz)
md5sums=(b1b98012d94ce2df5beaf32ab485d785)


build() {
	mv $srcdir/${pkgname}${pkgver}/compiler/Makefile.linux $srcdir/${pkgname}${pkgver}/compiler/Makefile
	mv $srcdir/${pkgname}${pkgver}/interpreter/Makefile.linux $srcdir/${pkgname}${pkgver}/interpreter/Makefile
	cd $srcdir/${pkgname}${pkgver}/interpreter
  make || return 1
  cd $srcdir/${pkgname}${pkgver}/compiler
  make || return 1
	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/alan/
	cp $srcdir/${pkgname}${pkgver}/interpreter/arun $pkgdir/usr/bin/
	cp $srcdir/${pkgname}${pkgver}/compiler/alan $pkgdir/usr/bin/
	cp -fr $srcdir/${pkgname}${pkgver}/lib  $pkgdir/usr/share/alan
	cp -fr $srcdir/${pkgname}${pkgver}/samples  $pkgdir/usr/share/alan
	echo -e "\n\nRun alan /usr/share/alan/samples/cloak.alan -include /usr/share/alan/lib to compile your first game. Run arun cloak.a3c to play it.\n\n"
}

