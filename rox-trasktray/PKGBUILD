# Contributor:	Pablo Lezaeta	<prflr88 @ gmail.com>

pkgname=rox-trasktray
_pkgname=TaskTray
pkgver=0.7
_pkgver=0.7
pkgrel=2
pkgdesc="Shows open windows as icons in a growing widget"
group=('rox-desktop')
arch=('any')
url="http://roscidus.com/desktop/TaskTray"
license=('GPL')
depends=('rox-lib' 'traylib' 'python2-wnck' 'libwnck')
source=(ftp://ftp.berlios.de/pub/rox4debian/apps/TaskTray-0.7.tgz
	python2.patch)

build() {
	cd "$srcdir/$_pkgname"
	patch -Np1 -i ../python2.patch
	rm -R Help
	mkdir -p "$pkgdir/usr/share/$pkgname"
	cp -R * "$pkgdir/usr/share/$pkgname"
	cp -R .DirIcon "$pkgdir/usr/share/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	echo "#!/usr/bin/env bash" > $pkgdir/usr/bin/$pkgname
	echo "/usr/share/$pkgname/AppRun" >> $pkgdir/usr/bin/$pkgname
	chmod +x $pkgdir/usr/bin/$pkgname
}

md5sums=('c29872e8cf33dfd1e1297421114f35cc'
         '4b8c0b2189793ca016fa96c49b55dc9a')

