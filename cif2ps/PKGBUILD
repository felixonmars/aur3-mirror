
# Contributor: Erico Nunes <nunes.erico at gmail.com>

pkgname=cif2ps
pkgver=0.1
pkgrel=1
pkgdesc="Utility to convert Caltech Intermediate File (.cif) to postscript."
arch=('i686' 'x86_64')
url="http://www.ittc.ku.edu/EECS/EECS_546/magic/files/cif2ps/"
license=('custom')
source=(http://www.ittc.ku.edu/EECS/EECS_546/magic/files/cif2ps/Makefile
	http://www.ittc.ku.edu/EECS/EECS_546/magic/files/cif2ps/README
	http://www.ittc.ku.edu/EECS/EECS_546/magic/files/cif2ps/cif2ps.1
	http://www.ittc.ku.edu/EECS/EECS_546/magic/files/cif2ps/cif2ps.c
	http://www.ittc.ku.edu/EECS/EECS_546/magic/files/cif2ps/cifgood.c
	http://www.ittc.ku.edu/EECS/EECS_546/magic/files/cif2ps/cifplot.c
	http://www.ittc.ku.edu/EECS/EECS_546/magic/files/cif2ps/define.h
	http://www.ittc.ku.edu/EECS/EECS_546/magic/files/cif2ps/layerkey.csh
	http://www.ittc.ku.edu/EECS/EECS_546/magic/files/cif2ps/layers.c
	http://www.ittc.ku.edu/EECS/EECS_546/magic/files/cif2ps/note
	http://www.ittc.ku.edu/EECS/EECS_546/magic/files/cif2ps/psheader.ps
	http://www.ittc.ku.edu/EECS/EECS_546/magic/files/cif2ps/styles.c
)
md5sums=('3f7d5d034160575b9db4cc4753b4e7cf'
         '6df42b586c5609e835ae85f55cd4efe6'
         'ddc5dca0f607741f46857343e1a31d83'
         '13776086729deaaeaad4d5b325cda47e'
         'aca671797f48a6b5a6b8d78f1b43f689'
         '9567144ff1ca716eb282a6521a066094'
         '95e1b01a9d762e82e88efcdb5fd719d3'
         '6154fb181d5599f1c5cc1986f539c772'
         '65332132a2ac1f6ad3ac584839d526a9'
         'b15b52f572d4bbe0e0f4a8e0b717fa39'
         '72dd4760a5359fae677dae7ef17bd60f'
         '0a5de3528150aa1f51334e3b7897c621')


build() {
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/man/man1
	make
	make install DEST=$pkgdir/usr
}

