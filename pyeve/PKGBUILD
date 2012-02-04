# Maintainer:  <andrew@andrewyates.net>
arch=(i686 x86_64)
pkgname=pyeve
pkgver=0.3
pkgrel=1
pkgdesc="QT skill monitor for EVE Online"
url="http://sourceforge.net/projects/pyeve/"
license=('GPL2')
depends=('python>=2.5.2' 'pyqt')
makedepends=()

source=("http://downloads.sourceforge.net/pyeve/pyEVE_$pkgver.tgz" 'pyeve' 'path.patch')
md5sums=('8bc1520aab6de3c92c7bc74d0dcc284c' 'f8b14f6e258a7b7dc5312c65aa17a961' '236b9b3bb618ed0bc3480c5c68ebbb84')

build() {
  cd $startdir/src/pyEVE

  patch -p0 -i ../../path.patch

  ./build.sh all || return 1
    
  mkdir -p $startdir/pkg/usr/lib/python2.5/site-packages/pyeve
  cp -R deploy/* $startdir/pkg/usr/lib/python2.5/site-packages/pyeve/
  
  mkdir -p $startdir/pkg/usr/bin
  chmod a+rx $startdir/pyeve
  cp $startdir/pyeve $startdir/pkg/usr/bin/
}
