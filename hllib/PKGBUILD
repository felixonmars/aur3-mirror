# Maintainer: Kevin Cox <kevincox.ca@gmail.com>

pkgname=hllib
pkgver=2.4.4
pkgrel=1
pkgdesc="Libray and program for working with Half-Life 2 related files."
arch=('i686' 'x86_64')

url="http://nemesis.thewavelength.net/index.php?p=35"
license=('GPL' 'LGPL')

source=('http://nemesis.thewavelength.net/files/files/hllib244.zip'
        'Makefile.patch')
sha1sums=('6a4266a9329969ab75eefe79a7e9cc34858f1f87'
          'ceff119ca5c9143e8c953aefac1ca01020d69453')

depends=()
conflicts=()

build()
{
	msg 'Building HLLib...'

	patch 'HLLib/Makefile' 'Makefile.patch'
	cd 'HLLib'
	make install "PREFIX=$pkgdir/usr"
	cd ..

	msg 'Building HLExtract...'
	cd 'HLExtract'
	cc -o 'hlextract' -I "$pkgdir/usr/include/" -L "$pkgdir/usr/lib/" -lhl 'Main.c'
	install -Dm 775 'hlextract' "$pkgdir/usr/bin/hlextract"
	cd ..
}
