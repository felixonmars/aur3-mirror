# Maintainer: Dennis Boerm <allspark AT planetcyborg DOT de>

pkgname=netbeans-ruby
pkgver=6.9.1
pkgrel=2
pkgdesc="Netbeans IDE development platform with Ruby support"
arch=('i686' 'x86_64')
url="http://www.netbeans.org"
license=('CDDL' 'GPL')
depends=('jre')
provides=('netbeans-ruby')
conflicts=('netbeans')
optdepends=("rake: to build ruby programs")
install=netbeans.install
source=(http://download.netbeans.org/netbeans/6.9.1/final/zip/netbeans-6.9.1-201007282301-ml-ruby.zip netbeans.sh netbeans.desktop)
md5sums=('4d72c3fd7be8c1517b0324a99abc9d38'
		 'bce2535c11a71eb311da48b931563717'
		 '6d93755de6081c11f7eb91b4fe29cbb3')

build() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/netbeans

	rm $srcdir/netbeans/bin/netbeans.exe

	cp -r $srcdir/netbeans/* $pkgdir/usr/share/netbeans/

	install -D -m755 $srcdir/netbeans.sh $pkgdir/etc/profile.d/netbeans.sh 
	install -D -m644 $srcdir/netbeans.desktop $pkgdir/usr/share/applications/netbeans.desktop
	
	mkdir -p $pkgdir/usr/bin 
	ln -s /usr/share/netbeans/bin/netbeans $pkgdir/usr/bin/netbeans
}
