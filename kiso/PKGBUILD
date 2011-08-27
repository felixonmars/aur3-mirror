# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Desislav <DesislavPetrov@gmail.com>

pkgname=kiso
pkgver=0.8.3
pkgrel=7
pkgdesc="An application for KDE, to make extracting and editing of ISO-Images."
license=('GPL')
arch=('i686' 'x86_64')
url="http://kiso.sourceforge.net"
depends=('kdelibs3' 'cdrdao' 'libcdio')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
	'libcdio.patch' 'kiso.desktop' 'kiso.png')
md5sums=('6f32662f5c1ade8df9b6a76b7403cede'
	'e6de467b2edf75e7dba24ff06735209e'
	'6703537366480be26136adc47ca803df'
	'550cff867ddc9ab67e1f146c14437952')

build () {
  cd "$srcdir/$pkgname-$pkgver"

  cat ../libcdio.patch | patch -p1 -F5 || return 1

  . /etc/profile.d/kde3.sh
  . /etc/profile.d/qt3.sh
  export PATH=$QTDIR/bin:$PATH
  export QMAKESPEC=$QTDIR/mkspecs/linux-g++

  ./configure --prefix=/opt/kde \
    --without-arts
  make || return 1
  make DESTDIR="$pkgdir" install

  install -D -m644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -D -m644 ../$pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
