# Maintainer: Philipp pba3h11aso <philsch@hotmail.de>
pkgname=crmp-bin
pkgver=0.12.3
pkgrel=3
pkgdesc="Classic Ramona Audio Player"
arch=(x86_64)
url="http://code.google.com/p/crmp/"
license="MPL"
depends=('fmodex' 'qt' 'glut')
source=(http://crmp.googlecode.com/files/crmp-$pkgver-bin.tar.gz)
sha512sums=('f79fcda0029d5ed49789dad2c73e937b224507bc20b8d7402efd49cbacd84d74ef61844d9322ea2c2aac331ef0af3563d7e9c1882327204d014b61ab5f4ed9f1')
build () 
{
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/bin
	cp crmp $startdir/pkg/usr/bin/
	mkdir -p $startdir/pkg/usr/share/applications/
	cp crmp.desktop $startdir/pkg/usr/share/applications/
	mkdir -p $startdir/pkg/usr/share/icons/crmp/
	cp application_crmp.png $startdir/pkg/usr/share/icons/crmp/application_crmp.png

}