# Contributor: Gino Pezzin <pezzin@gmail.com>
pkgname=pyvon
pkgver=1.3.2
pkgrel=1
pkgdesc="Pyvon is an good editor for POV-RAY(povray). It is written with Python"
url="http://pyvon.sourceforge.net/"
license="GPL"
depends=('bash' 'python' 'povray')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://pyvon.sourceforge.net/pyvon-$pkgver.tgz $pkgname.png $pkgname.desktop)
md5sums=('05335a5b3de72e7dea3200e0f68acde2' '497406b4a13bf52d0ee1c11ad65ab07f' 'b905a11b7e63149644cc5203c06ff9d7')

build() {
  cd $startdir/src/
	install -d -m755 $startdir/pkg/usr/{bin,share/{pixmaps,applications}}
  	install -m755 $startdir/src/pyvon_tmp/d45.tgz $startdir/pkg/usr/share/d45.tgz
	cd $startdir/pkg/usr/share
	tar xzvf d45.tgz
	chmod -R 755 $startdir/pkg/usr/share
	rm -f $startdir/pkg/usr/share/d45.tgz	
	sed -r -i -e 's/local/share/' $startdir/pkg/usr/share/pyvon/{pyvon,res.py}
	install -m755 $startdir/pkg/usr/share/pyvon/pyvon $startdir/pkg/usr/bin/pyvon
	install -m644 ../../../$pkgname.png $startdir/pkg/usr/share/pixmaps/$pkgname.png
  	install -m644 ../../../$pkgname.desktop $startdir/pkg/usr/share/applications/$pkgname.desktop
}