# Maintainer:
# Contributor: Juergen Hoetzel <juergen@archlinux.org> 
# Contributor: William Rea <sillywilly@gmail.com>, 
# Contributor: Bjorn Lindeijer <bjorn@lindeijer.nl>
# Contributor: Jose Riha <jose 1711 gmail com>

pkgname=cegui-ogre
pkgver=0.7.5
pkgrel=3
pkgdesc="A free library providing windowing and widgets for graphics APIs/engines - with ogre dependency"
arch=(i686 x86_64)
url="http://crayzedsgui.sourceforge.net"
#options=('!libtool')
license=("MIT")
depends=('pcre' 'glew' 'expat' 'freetype2' 'libxml2' 'devil' 'freeglut' 'lua' 'silly' 'ogre' 'boost')
makedepends=('python2')
source=(http://downloads.sourceforge.net/crayzedsgui/CEGUI-$pkgver.tar.gz)
md5sums=('38c79d1fdfaaa10f481c99a2ac479516')
conflicts=('cegui')
provides=('cegui')

build() {
  cd $srcdir/CEGUI-${pkgver}
  sed -i '/#include "CEGUIBase.h"/a \#include <cstddef>' cegui/include/CEGUIString.h
    
# old configure from cegui-0.6.X, to remove later!
#  ./configure --prefix=/usr \                                                                                                                
#    --sysconfdir=/etc \                                                                                                                      
#    --enable-devil \                                                                                                                         
#    --enable-silly \                                                                                                                         
#    --disable-xerces-c \                                                                                                                     
#    --with-default-image-codec=SILLYImageCodec \                                                                                             
#    --enable-lua                                                                                                                             
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --disable-xerces-c \
    --enable-null-renderer

make
}

package() {
  cd $srcdir/CEGUI-${pkgver}
 
  make DESTDIR=${pkgdir} install

  install -D -m644 doc/COPYING ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}

