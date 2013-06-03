# Contributer: Thanx <thanxm@gmail.com>
pkgname=exploitdb
pkgver=1.0.0
pkgrel=1
pkgdesc="The Exploit Database (EDB) – an ultimate archive of exploits and vulnerable software - A collection of hacks"
url="http://www.exploit-db.com"
license="custom"
arch=('i686' 'x86_64')
depends=('')
source=(http://www.exploit-db.com/archive.tar.bz2)
md5sums=('92afdc0a08929cecabc90f3cedd9f459')

build(){
	mkdir $startdir/src/exploit-db
	mv $startdir/src/platforms $startdir/src/exploit-db/
#	chmod +rw -R $startdir/src/exploit-db/*	
	cd $startdir/src/exploit-db
}

package() {
	install -d -m 755 "$pkgdir/usr/src"
	mv "$srcdir/exploit-db" "$pkgdir/usr/src"
}
