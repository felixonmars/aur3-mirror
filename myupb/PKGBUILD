# Maintainer: Adrien Dadouchi <messenger@purogurama.com>
# Contributor: Adrien Dadouchi <messenger@purogurama.com>
pkgname=myupb
pkgver=2.2.6
pkgrel=13
pkgdesc="Simple and lightweight PHP forum (without SQL!)."
arch=(any)
url="http://www.myupb.com"
license=('custom:CC BY-NC-SA')
groups=
provides=
depends=('php')
optdepends=()
makedepends=('patch')
conflicts=
replaces=
backup=
install=('myupb.install')
source=(http://downloads.sourceforge.net/project/textmb/UPB/UPB%202.2.6/upb2.2.6.zip patch.diff)
md5sums=(6168ad7e203f9b60677a8537b04dece8 902bc39070d37b91e42eeb914cd8cce1)
 
build() {
	patch -p1 -d $srcdir < $srcdir/patch.diff
	mkdir -p $pkgdir/usr/share/webapps/myupb/
	mkdir -p $pkgdir/usr/share/licenses/myupb/
	cp $srcdir/license.txt $pkgdir/usr/share/webapps/myupb/
	cp $srcdir/license.txt $pkgdir/usr/share/licenses/myupb/COPYING
	cp $srcdir/readme.txt $pkgdir/usr/share/webapps/myupb/
	cp $srcdir/*.php $pkgdir/usr/share/webapps/myupb/
	cp -r $srcdir/{backup,images,includes,skins,smilies} $pkgdir/usr/share/webapps/myupb/
	chmod 0777 -R $pkgdir/usr/share/webapps/myupb/
	touch $pkgdir/usr/share/webapps/myupb/config.php
	chmod 0666 $pkgdir/usr/share/webapps/myupb/config.php
}
