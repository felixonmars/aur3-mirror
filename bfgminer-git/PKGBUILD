# Maintainer: Tamaasz
# Contributor: LexsZero <lexszero@gmail.com>
# Contributor: Kamil Śliwak <cameel2/at/gmail/com>
# Contributor: intgr

pkgname=bfgminer-git
_gitname=bfgminer
pkgver=4.2.0.53.g89fb0f0
pkgrel=1
pkgdesc="Modular FPGA/GPU miner written in C, featuring overclocking, monitoring, fan speed control and remote interface capabilities."
arch=('i686' 'x86_64')
url="git://github.com/luke-jr/bfgminer.git"
license=('GPLv3')
depends=('curl' 'ncurses' 'jansson' 'libmicrohttpd')
optdepends=('opencl')
makedepends=('git' 'yasm' 'uthash')
conflicts=(bfgminer)
provides=(bfgminer)
source=('git://github.com/luke-jr/bfgminer.git')
md5sums=('SKIP')

pkgver()
{
	cd $srcdir/$_gitname
	
	echo $(git describe --always | sed 's|bfgminer-||g' | sed 's|-|.|g')
}

prepare()
{
	cd $srcdir/$_gitname
	
	./autogen.sh
	./configure --prefix=/usr --enable-cpumining --enable-scrypt
}

build()
{
	cd $srcdir/$_gitname
	
	make
}

package()
{
	cd $srcdir/$_gitname
	
	make DESTDIR="$pkgdir" install
}
