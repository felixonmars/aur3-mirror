# Maintainer: Christophe Gueret <christophe.gueret@gmail.com>
# Contributor: Gour <Gour <gour@mail.inet.hr>>

pkgname=hulahop  
pkgver=0.8.2
pkgrel=1
pkgdesc="Widget for embedding a Mozilla browser"
url="http://git.sugarlabs.org/projects/hulahop"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('xulrunner192>=1.9.1.3-2' 'pygtk')
groups=('sugar-desktop' 'glucose')
source=(http://download.sugarlabs.org/sources/sucrose/glucose/$pkgname/$pkgname-$pkgver.tar.bz2 fix_idl.patch)
md5sums=('68537d140ef44a9649a461e3a7c500ac'
         '79ae5998dc17b182d36d3654ca819ed9')

build() {
	cd $srcdir/$pkgname-$pkgver
	patch -p1 < ../../fix_idl.patch

	PYTHON=python2 ./configure --prefix=/usr || return 1
	make || return 1
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}


