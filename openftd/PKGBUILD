# Contributor: Jordy van Wolferen <jordz@archlinux.us>

pkgname=openftd
pkgver=1.2.1
pkgrel=3
pkgdesc="Open source version of the windows program FTD"
arch=('i686' 'x86_64')
url="http://www.openftd.org/"
license="unknown"
depends=('glib2' 'gtk2' 'libxml2' 'libxslt' 'openssl' 'curl' 'sqlite3' 'libsexy' 'gtkhtml' 'gtkspell' 'libsm')
optdepends=('libgnomeui: bug-buddy support')
conflicts=(ftd4linux)
source=(http://ftd4linux.nl/releases/$pkgname-$pkgver.tar.bz2)
md5sums=('591b4c7b4708bef8113aa3063d14516b')

build() 
{
	cd ${srcdir}/$pkgname-$pkgver
	./configure --prefix=/usr 
	make || return 1
	make DESTDIR=${pkgdir} install
}
