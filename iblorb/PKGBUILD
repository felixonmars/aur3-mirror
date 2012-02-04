# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=iblorb
pkgver=1
pkgrel=1
pkgdesc="A tool to pack resource files in blorb packages for interactive fiction."
arch=(i686 x86_64)
url="http://www.trenchcoatsoft.com/projects.html"
license=('gpl')
depends=('glibc')
optdepends=('inform')
#provides=()
#conflicts=()
groups=(inform)
source=(http://www.caad.es/baltasarq/download/${pkgname}-src.zip)
md5sums=('fb85a96dca92d1ef836db9284d667b9b')


build() {
  cd $srcdir/${pkgname}-src
    make || return 1
	
	mkdir -p $pkgdir/usr/bin
	
	cp -fr $srcdir/${pkgname}-src/blc $pkgdir/usr/bin
	cp -fr $srcdir/${pkgname}-src/bres $pkgdir/usr/bin
	cp -fr $srcdir/${pkgname}-src/bmerge $pkgdir/usr/bin
	
}
