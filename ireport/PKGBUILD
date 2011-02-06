# Contributor: Emmanuel Hamelet <starlifter at free dot fr>
# 
# 17-07-2008

pkgname=ireport
pkgver=4.0.0
pkgrel=1
pkgdesc="A visual report builder for JasperReports"
license="GPL"
url="http://jasperforge.org/projects/ireport"
source=(http://switch.dl.sourceforge.net/sourceforge/$pkgname/iReport-$pkgver.tar.gz)
depends=("jre")
md5sums=('47c82a170597e2ecccf34dc1660fa4f1')
arch=('i686, x86_64')

build() { 
	cd $startdir/src/iReport-$pkgver
	mkdir -p $startdir/pkg/usr/share/java/ireport
	cp ./lib/*.jar $startdir/pkg/usr/share/java/ireport
        install -D ./policy.all $startdir/pkg/usr/share/ireport/policy.all
        cp -r ./fonts ./plugins ./templates  $startdir/pkg/usr/share/ireport
        install -D $startdir/ireport $startdir/pkg/usr/bin/ireport
        install -D $startdir/ireport.desktop 
$startdir/pkg/usr/share/applications/ireport.desktop
}

