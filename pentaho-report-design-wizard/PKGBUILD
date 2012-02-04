# Contributor: Hubert Star (hubertstar at gmail dot com)
pkgname=pentaho-report-design-wizard
pkgver=1.7.1.1017
pkgrel=1
pkgdesc="Pentaho Report Wizard"
license=('MPL')
url="http://www.pentaho.com"
depends=('jre')
makedepends=('unzip')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/pentaho/$pkgname-$pkgver.zip" "pentaho-report-design-wizard.png" "pentaho-report-design-wizard.sh" "pentaho-report-design-wizard.desktop")
md5sums=('7f0984bd45129561d3028609f1c8177d' 'c17e228d913ba9fc73880a809be8d78a' '1f373cb37678d3315d1496a51e52797b' 'abe9f542700fb4974385253c31a6c94f')

build() {
	cd $startdir/src/$pkgname-$pkgver
	mkdir -p $startdir/pkg/opt/pentaho/report-design-wizard
	cp $startdir/src/$pkgname-$pkgver/* $startdir/pkg/opt/pentaho/report-design-wizard -rf
	rm $startdir/pkg/opt/pentaho/report-design-wizard/reportwizard.bat -rf
	rm $startdir/pkg/opt/pentaho/report-design-wizard/reportwizard_console.bat -rf
	rm $startdir/pkg/opt/pentaho/report-design-wizard/reportwizard_osx.sh -rf
	chmod a-x $startdir/pkg/opt/pentaho/* -R
	chmod a+X $startdir/pkg/opt/pentaho/* -R
	chmod a+x $startdir/pkg/opt/pentaho/report-design-wizard/reportwizard_linux.sh
	
	install -D -m0644 $startdir/src/pentaho-report-design-wizard.png $startdir/pkg/usr/share/pixmaps/pentaho-report-design-wizard.png
	install -D -m0755 $startdir/src/pentaho-report-design-wizard.sh $startdir/pkg/usr/bin/pentaho-report-design-wizard
	install -D -m0644 $startdir/src/pentaho-report-design-wizard.desktop $startdir/pkg/usr/share/applications/pentaho-report-design-wizard.desktop
}
