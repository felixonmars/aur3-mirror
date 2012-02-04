# Contributor: Arnold Perne <aperne@home.nl>
pkgname=possibleworlds
pkgver=1.1
pkgrel=1
pkgdesc="Fast paced and action packed underwater epic in full 3D"
url="http://possibleworlds.cjb.net/"
depends=('sdl' 'freeglut')
makedepends=('unzip') 
source=('http://kent.dl.sourceforge.net/sourceforge/possibleworlds/psworlds-src.zip' 'http://kent.dl.sourceforge.net/sourceforge/possibleworlds/psworlds-media.zip')
md5sums=('fa84e7ee515f62dafd4d6b4f7d5fe10b' 'a89df91e47d67c700e1d2dad9eea3de4')

build() {
  cd $startdir/src/PossibleWorlds/psworlds/source
  make || return 1
  mkdir -p $startdir/pkg/usr/{bin,share/psworlds,include,lib}
  install $startdir/src/PossibleWorlds/fmod/inc/fmod.h $startdir/pkg/usr/include/
  install $startdir/src/PossibleWorlds/fmod/inc/fmod_errors.h $startdir/pkg/usr/include/
  install $startdir/src/PossibleWorlds/fmod/inc/wincompat.h $startdir/pkg/usr/include/
  install $startdir/src/PossibleWorlds/fmod/lib/fmodvc.lib $startdir/pkg/usr/lib/
  install $startdir/src/PossibleWorlds/fmod/lib/libfmod.a $startdir/pkg/usr/lib/
  install $startdir/src/PossibleWorlds/fmod/libfmod-3.33.so $startdir/pkg/usr/lib/
  cp -R $startdir/src/PossibleWorlds/psworlds/ $startdir/pkg/usr/share/
  ln -sf /usr/share/psworlds/psworlds-linux $startdir/pkg/usr/bin/psworlds
  
}
