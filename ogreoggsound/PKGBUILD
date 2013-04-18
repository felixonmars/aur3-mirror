# Maintainer:	Jesse Jaara	<gmail: jesse.jaara>

pkgname=ogreoggsound
pkgver=1.23
pkgrel=1
pkgdesc="A wrapper around OpenAL to quickly add 2D/3D audio to applications."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ogreoggsound/"
license=('LGPL')
depends=('ogre' 'openal' 'libvorbis')
conflicts=('ogreoggsound-svn')
source=(http://sourceforge.net/projects/ogreoggsound/files/OgreOggSound-Cthugha/OgreOggSound-v1.23.7z)

build() {
  cd "$srcdir/OgreOggSound"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}


package() {
  cd "$srcdir/OgreOggSound"
  make DESTDIR="$pkgdir/" install
}

md5sums=('21b6d34e62c5094dee3d2cb75ab1dd78')
