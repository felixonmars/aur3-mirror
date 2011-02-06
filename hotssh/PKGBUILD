# Contributor: Michael Kanis <mkanis@gmx.de>
pkgname=hotssh
pkgver=0.2.7
pkgrel=1
pkgdesc="An interface to Secure Shell, for GNOME and OpenSSH"
url="http://www.gnome.org/projects/hotssh/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('python>=2.4' 'openssh' 'gtk2>=2.10' 'dbus-python')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/0.2/$pkgname-$pkgver.tar.gz)
sha256sums=('a1ec3aaac78b58095f1bffef927371e59fe48f5eeae1bddbbc75f864bd0cdd9e')

build() {
	cd $startdir/src/$pkgname-$pkgver
	python ./waf configure --prefix=/usr || return 1
	python ./waf --progress || return 1
	python ./waf --destdir=$startdir/pkg install
	install -d $startdir/pkg/usr/share/pixmaps
	install images/hotwire-openssh.png $startdir/pkg/usr/share/pixmaps/
} 
