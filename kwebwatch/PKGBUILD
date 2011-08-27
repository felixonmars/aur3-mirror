# Contributor: Petr Malat (AUR username is petris)
pkgname=kwebwatch
pkgver=0.9.8
pkgrel=1
pkgdesc="Utility designed to monitor urls, checking for changes. Docks into KDE panel."
arch=('i686' 'x86_64')
url="http://kwebwatch.sourceforge.net/"
license=('GPL')
depends=('kdelibs>=3.0' 'perl')

source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2")
	
md5sums=('630b6dfdc3f4daab7f25e9c3434ace67')

CXXFLAGS="-march=pentium3 -O2"

build() {
  . /etc/profile.d/qt3.sh
  PATH=$QTDIR/bin:$PATH

  cd $startdir/src/$pkgname-$pkgver
	
  ./configure \
	--prefix=/opt/kde \
	--disable-debug \
	|| die "Configure failed"

  make || die "Make failed"

  sed -i "s|^prefix = /|prefix = $startdir/pkg/|" Makefile
  sed -i "s|^prefix = /|prefix = $startdir/pkg/|" libwebwatch/Makefile
  sed -i "s|^prefix = /|prefix = $startdir/pkg/|" kwebwatch/Makefile

  make INSTALL_ROOT=$startdir/pkg install
}
