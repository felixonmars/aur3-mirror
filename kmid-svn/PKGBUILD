# Maintainer: Košava <kosava@archlinux.us>
pkgname=kmid-svn
pkgver=1203112
pkgrel=1
pkgdesc="KDE midi/karaoke file player, with configurable midi mapper"
arch=('i686' 'x86_64')
url="http://developer.kde.org/~larrosa/kmid.html"
license=('GPL')
depends=('kdelibs' 'alsa-lib' 'phonon' 'drumstick')
makedepends=('automoc4' 'cmake')
optdepends=('timidity++' 'fluidsynth')
provides=('kmid')
conflicts=('kmid')

_svntrunk="svn://anonsvn.kde.org/home/kde/trunk/extragear/multimedia/kmid/"
_svnmod=kmid

build() {
  cd $srcdir

  svn co $_svntrunk $_svnmod

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $_svnmod

  cmake -DCMAKE_INSTALL_PREFIX=/usr

  make VERBOSE=1 
  make DESTDIR="$pkgdir" install 

  rm -rf $srcdir/$_svnmod-build
}