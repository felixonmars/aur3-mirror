# Contributor: Carlos Ruiz <cailovirtual@gmail.com>
# Contributor: Felipe Weckx <felipe@weckx.net>

pkgname=hipo
pkgver=0.6.1
pkgrel=1
pkgdesc="Hipo is an application that allows you to manage the data of your iPod, Hipo is written in C# using Mono, GTK#, the cute ipod-sharp library and for tag editing it uses taglib-sharp."
url="http://www.gnome.org/projects/hipo/"
license="GPL"
arch=('i686' 'x86_64')
depends=(ipod-sharp gtk-sharp-2 mono gtk2 gnome-sharp taglib-sharp ndesk-dbus-glib)
source=(http://ftp.gnome.org/pub/GNOME/sources/hipo/0.6/$pkgname-$pkgver.tar.bz2)
md5sums=('20f53b80acee4cd69594a3d34505d499')


build() {
export MONO_SHARED_DIR="${srcdir}/.wabi"
mkdir -p "${MONO_SHARED_DIR}"

cd $startdir/src/$pkgname-$pkgver
./configure --prefix=/usr
make || return 1
make DESTDIR=$startdir/pkg install
}

