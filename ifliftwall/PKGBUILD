# ifliftwall: Installer: Arch
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>

pkgname=ifliftwall
pkgver=0.6.1
pkgrel=1
pkgdesc="Sets the latest picture from 'InterfaceLIFT' as your KDE desktop wallpaper."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/ifliftwall?content=76610"
license=('GPL')
source=(http://kde-apps.org/CONTENT/content-files/76610-${pkgname})
md5sums=('ee5c29e9c0560571d1e986f25726de40')

build() {
	cd $startdir/src/
	install -D -m 755 76610-${pkgname} $startdir/pkg/usr/bin/${pkgname} || return 1
}
