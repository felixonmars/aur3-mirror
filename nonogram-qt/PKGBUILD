# Contributer: giacomogiorgianni@gmail.com 

pkgname=nonogram-qt
pkgver=1.0.0
pkgrel=1
pkgdesc="A nonogram (aka \"paint by numbers\") puzzle game."
arch=('i686' 'x86_64')
url="http://opendesktop.org/content/show.php/Nonogram-qt?content=155694"
license=('GPL')
conflict=(yarock-new)
depends=('qt4')
source=("http://opendesktop.org/CONTENT/content-files/155694-$pkgname-$pkgver.tar.bz2" "${pkgname}.desktop")
md5sums=('535b2b8acb8882bdfe9bfd26ee076695'
	  '0dfd0aa9444fd42aa2b9d538f5728e29')

build() {
   cd $srcdir/$pkgname-$pkgver
   qmake-qt4 PREFIX="/usr/"
   make
   install -D -m755 $pkgname ${pkgdir}/usr/bin/$pkgname
   install -D -m644 ${srcdir}/$pkgname.desktop \
		${pkgdir}/usr/share/applications/$pkgname.desktop
   #make INSTALL_ROOT=$pkgdir install
}
