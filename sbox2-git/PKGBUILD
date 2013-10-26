# Maintainer: Stefan Damm <autama at nurfuerspam.de>

pkgname=sbox2-git
pkgdesc="Scratchbox 2 is a cross-compilation engine, it can be used to create a highly flexible SDK."
license=('GPL')
arch=('i686' 'x86_64')
pkgver=2
pkgrel=1

depends=('autoconf' 'qemu')
makedepends=('autoconf' 'git')
url="https://maemo.gitorious.org/scratchbox2"

build()
{
	git clone git://gitorious.org/scratchbox2/scratchbox2.git
	cd $srcdir/scratchbox2
	./autogen.sh
	./configure
	make
}

package()
{
	cd $srcdir/scratchbox2
	make prefix=${pkgdir}/usr install	
}


