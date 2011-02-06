# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=bresc
pkgver=0.32
pkgrel=1
pkgdesc="A single tool to pack resource files in blorb packages for interactive fiction."
arch=(i686 x86_64)
url="http://www.caad.es/baltasarq/prys/bresc/bresc.html"
license=('gpl')
depends=('glibc')
optdepends=('inform')
#provides=()
#conflicts=()
groups=(inform)
source=(http://www.caad.es/baltasarq/download/${pkgname}-${pkgver}-src.zip)
md5sums=('d9d910b26aa22592a1976fb2645da108')


build() {
  cd $srcdir/${pkgname}-${pkgver}/src/
    cc bresc.c util.c -obresc || return 1
	
	mkdir -p $pkgdir/usr/bin
	
	cp -fr $srcdir/${pkgname}-${pkgver}/src/${pkgname} $pkgdir/usr/bin
	chmod +x $pkgdir/usr/bin/${pkgname}
}
