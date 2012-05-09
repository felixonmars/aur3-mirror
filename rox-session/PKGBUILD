# Contributor: Gary James <garyjames82@gmail.com>
# Contributor: Pablo Lezaeta <prflr88 @ gmail.com>

pkgname=rox-session
pkgver=0.41.0
pkgrel=5
group=('rox-desktop')
pkgdesc="ROX Filer session manager"
arch=('i686' 'x86_64')
url="http://roscidus.com/desktop/ROX_Session"
license=('GPL')
depends=(rox-lib rox dbus xterm dbus-python libxtst librsvg)
source=(http://downloads.sourceforge.net/rox/$pkgname-$pkgver.tar.gz
	ROX-Session_choose_wm.py_es.diff
	ROX-Session_es.diff
	python2.patch)

build() {
	cd "$srcdir/ROX-Session"
	patch -Np1 -i ../ROX-Session_es.diff
	patch -Np1 -i ../python2.patch
	rm -R Help
	mkdir -p "$pkgdir/usr/share/rox-session"
	mkdir -p "$pkgdir/usr/bin"
	cp -R * "$pkgdir/usr/share/rox-session"
	cp .DirIcon "$pkgdir/usr/share/rox-session"
	cd "$pkgdir/usr/share/rox-session"
	./AppRun --compile
	echo "#!/usr/bin/env bash" > $pkgdir/usr/bin/rox-session 
	echo "sh /usr/share/rox-session/AppRun" >> $pkgdir/usr/bin/rox-session
	chmod +x $pkgdir/usr/bin/rox-session
}

md5sums=('ba8a91d5ec5aa21644342310d2f3b5f0'
	'8eeb908613f07a5c9b01af94c3adcbe4'
	'fc9d4760b57c0974d651cee0cfe2bb0f'
	'dae7de0536958dceb0f474e8b840dc69')
