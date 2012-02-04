# Maintainer: Jynko <jayson at it-linux dot com>
# Contributor: Eric Forgeot < http://ifiction.free.fr >

pkgname=battalion2004
pkgver=c
pkgrel=2
pkgdesc="Game in which you are a rampaging monster and destroy the city."
arch=(i686)
url="http://www.battalion2004.tk/"
license=('free')
depends=('mesa' 'freeglut' 'openal')

source=(http://personal.telefonica.terra.es/web/astrofotoweb/battalion2004/data/battalion2004c.zip
	battalion2004.png
	battalion2004.sh
	battalion2004.desktop
	alutfix.patch)

md5sums=('dbec7fa6afaad294cf5d9a32b86e5fd6'
	 '90430a5ab8a9dba9bdb2fdbd0afb6b77'
	 '1e8a36247fc9fd4895c5ae3616a854e7'
	 '6f2a437a4c8faf987c53b047c40c1a71'
	 '04989036677caea4a142a49b08e834bf')


build() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/pixmaps
  mkdir -p $pkgdir/usr/share/applications
  install -Dm755 $pkgname.sh $pkgdir/usr/bin/$pkgname.sh
  install -D -m644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
 
  cd $srcdir/${pkgname}
	patch -p0 < ../../alutfix.patch
	make || return 1
	
	mkdir -p $pkgdir/opt/battalion2004
	cp battalion2004 $pkgdir/opt/battalion2004
	cp README.txt $pkgdir/opt/battalion2004
	cp README_2004.txt $pkgdir/opt/battalion2004
	touch $pkgdir/opt/battalion2004/battalion_hiscore
	chmod 666 $pkgdir/opt/battalion2004/battalion_hiscore
	cp -R battalion.data/ $pkgdir/opt/battalion2004	

}


