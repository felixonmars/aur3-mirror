# Maintainer: onny <onny@project-insanity.org>
# Contributor: onny <onny@project-insanity.org>

pkgname=cp210x-program
pkgver=0.2
pkgrel=1
pkgdesc="A library to provide access to the EEPROM of an Silabs CP210x under Linux"
url="http://cp210x-program.sourceforge.net/"
arch=('i686' 'x86_64')
license=("GPL")
depends=('python2')
install='cp210x-program.install'
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('8303c877de5aa70b1ce05e1b732cf1e0')
package() {
	cd $srcdir/$pkgname-$pkgver
	python2.7 setup.py install --root="${pkgdir}"
	echo "	ATTENTION: THIS VERSION OF cp210x-program IS NOT FULLY TESTED. IT MAY RENDER YOUR CP210x USELESS OR DESTROY IT."
}
