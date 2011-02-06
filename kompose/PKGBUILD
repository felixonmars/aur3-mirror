# Contributor: Vinay S Shastry <vinayshastry@gmail.com>
# Maintainer: Dan "ProgDan" Vratil <progdan@progdansoft.com>

pkgname=kompose
pkgver=0.5.4
pkgrel=4
pkgdesc="A fullscreen task manager for KDE"
arch=('i686' 'x86_64')
url="http://kompose.berlios.de/"
license=('GPL')
depends=('kdelibs3' 'imlib2' 'libxdamage' 'libxcomposite')
options=('libtool')
source=(http://download.berlios.de/kompose/$pkgname-$pkgver.tar.bz2 
	autotools-version.patch 
	kompose-0.5.4-ktoolbar.patch)

build() {
  . /etc/profile.d/qt3.sh
  export PATH=$QTDIR/bin:$PATH
  export QMAKESPEC=$QTDIR/mkspecs/linux-g++

  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i ../autotools-version.patch || return 1
  patch -Np0 -i ../kompose-0.5.4-ktoolbar.patch || return 1

  sed -i -e "s,automake\*1.9\*,automake\*1.9\* \| automake\*1.10\*," admin/cvs.sh
  make -f Makefile.cvs || return 1

  ./configure --prefix=/opt/kde --without-arts || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

  #installs icons in wrong location
  cd $startdir/pkg/opt/kde/share
  mv apps/kompose/icons .
}
md5sums=('9ae1540e91a4aeef0f71b28cf02c7869'
         '5ca052bb3fa72d596d33c823a37bf282'
         '570e6098dea621632265767296d691ac')
