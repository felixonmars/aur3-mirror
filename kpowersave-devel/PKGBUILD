# Contributor: cromo <dawid@klej.net>
pkgname=kpowersave-devel
pkgver=0.7.3
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="KDE-frontend for the power management" 
url="https://sourceforge.net/projects/powersave" 
license="GPL" 
depends=('kdelibs' 'kdebase' 'dbus-qt3' 'dbus' 'hal>=0.5.8.1') 
makedepends=('pkgconfig') 
conflicts=('kpowersave') 
provides=('kpowersave')
replaces=() 
backup=() 
install=kpowersave.install
source=(http://downloads.sourceforge.net/sourceforge/powersave/kpowersave-$pkgver.tar.bz2)
md5sums=('061cb55774ebac15549a1e7affa87827')

build() { 
cd $startdir/src/kpowersave-$pkgver
make -f admin/Makefile.common cvs 
./configure --prefix=/opt/kde --with-qt-dir=/opt/qt
make || return 1 
make DESTDIR=$startdir/pkg install 
}

