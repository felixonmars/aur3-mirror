# Contributor: Ivan25 <ivannDOTdevATgmailDOTcom>

pkgname=rhythmdesk
pkgver=0.0.11
pkgrel=1
pkgdesc="deskbar applet plugin for rhythmbox and exaile"
url="http://code.google.com/p/rhythmdesk"
arch=('any')
license=('GPL')
depends=('python' 'deskbar-applet')
source=("http://$pkgname.googlecode.com/files/$pkgname.py")
md5sums=('c6645ab846c9965ab751c7b2060fa453')

build() {
	install -Dm755 "$srcdir/rhythmdesk.py" "$pkgdir/usr/lib/deskbar-applet/modules-2.20-compatible/rhythmdesk.py"	
}
