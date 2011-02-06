# Contributor: Changaco <changaco ατ changaco δοτ net>

pkgname=pyloris
pkgver=3.2
pkgrel=3
pkgdesc="A scriptable tool for testing a server's vulnerability to connection exhaustion denial of service (DoS) attacks"
arch=('any')
url="http://motomastyle.com/pyloris"
license=('BSD')
depends=('python2' 'tk')
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname-$pkgver.tgz")
md5sums=('7cd0fcaaca1a68f7be9ebe45a3ebf7b7')

build() { 
	cd $srcdir/$pkgname-$pkgver
	mkdir -p $pkgdir/usr/share/$pkgname $pkgdir/usr/share/licenses/$pkgname $pkgdir/usr/share/doc/$pkgname $pkgdir/usr/bin
	install -t $pkgdir/usr/share/doc/$pkgname doc/*
	install -t $pkgdir/usr/share/licenses/$pkgname license/*
	rm -rf doc license
	install -t $pkgdir/usr/share/$pkgname *
	ln -s /usr/share/$pkgname/$pkgname.py $pkgdir/usr/bin/$pkgname
	sed -i 's|^#! */usr/bin/env python|#!/usr/bin/env python2|' $pkgdir/usr/share/$pkgname/*.py
}
