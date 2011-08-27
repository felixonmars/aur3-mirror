# $Id: PKGBUILD 12714 2010-03-12 12:11:01Z angvp $
# Maintainer: Jáchym Barvínek <jachymb@gmail.com>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Stefan Husmann  <stefan-husmann@t-online.de>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 
# Contributor: Manuel "ekerazha" C. (www.ekerazha.com)

pkgname=python3-configobj
pkgver=4.7.2
pkgrel=2
pkgdesc="A version of the configobj module patched fot Python 3"
arch=('i686' 'x86_64')
url="http://www.voidspace.org.uk/python/configobj.html"
license=('custom:voidspace')
depends=('python3')
source=("http://www.voidspace.org.uk/downloads/configobj-$pkgver.zip"
	'voidspace-license.txt' 'configobj-r80-python3-syntax-support.patch'  'validate.patch')
md5sums=('51cee395cfbf831339b03f72706de18e'
         '2068c55a3541ec936aa96c51947e0810'
	 'fc53c12dd2da6f94577173f3afd8fdf5'
	 'c0878291fa0d5447e49f14aee80ef0c1')

build() {
  cd $srcdir/configobj-$pkgver
  patch -Np0 -i $srcdir/configobj-r80-python3-syntax-support.patch || return 1
  patch -Np0 -i $srcdir/validate.patch || return 1
  python3 setup.py install --root=$pkgdir || return 1
  install -Dm644 $srcdir/voidspace-license.txt \
    $pkgdir/usr/share/licenses/$pkgname/LICENSE || return 1
}
