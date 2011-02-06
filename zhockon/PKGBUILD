# Contributor: William Oliveira de Lagos <williamx64@gmail.com>

pkgname=zhockon
pkgver=0.1.0
pkgrel=1
pkgdesc="A platform for game development and an alternative to DirectX"
arch=('i686' 'x86_64')
url="http://opensourcecia.wordpress.com/zhockon"
license=('LGPL')
groups=()
depends=('sdl' 'openal' 'freealut' 'freeglut' 'mesa' 'python')
provides=(zhockon)
conflicts=(zhockon-svn)
source=(http://downloads.sourceforge.net/zhockon/zhockon_0.1.x/zhockon_$pkgver.src.tar.gz)
md5sums=('6e584de25def841c263c7e228c973eb8')

build() {
  cd $srcdir/$pkgname.src/pymodules/pygame/
  python setup.py build
  cd build/
  mv lib.linux-i686-2.6 pygame &> /dev/null
  mv lib.linux-x86_64-2.6 pygame &> /dev/null
  cp -Rp pygame ../../../euphoria/zhgame/

  cd $srcdir/$pkgname.src/pymodules/pyopengl/
  python setup.py build
  cd build/lib/
  cp -Rp OpenGL ../../../../euphoria/zhgraphics/
  
  cd $srcdir/$pkgname.src/pymodules/pyopenal/
  python setup.py build
  cd build/lib.linux-i686-2.6 &> /dev/null
  cd build/lib.linux-x86_64-2.6 &> /dev/null
  cp -Rp * ../../../../euphoria/zhsound/

  cd $srcdir/$pkgname.src/pymodules/PIL/
  python setup.py build
  cd build/
  mv lib.linux-i686-2.6 PIL &> /dev/null
  mv lib.linux-x86_64-2.6 PIL &> /dev/null
  cp -Rp PIL ../../../euphoria/zhimage/
  
  cd $srcdir/$pkgname.src/euphoria/
  sed -i s/zopengl/OpenGL/g *.*
  sed -i s/zopenal/pyopenal/g *.*
  sed -i s/zimaging/PIL/g *.*

  mkdir $pkgdir/opt; mkdir $pkgdir/opt/zhockon
  cp -Rp $srcdir/$pkgname.src/* $pkgdir/opt/zhockon/
}
