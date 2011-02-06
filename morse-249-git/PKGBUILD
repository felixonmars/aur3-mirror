pkgname=morse-249-git
pkgver=20101123
pkgrel=1
pkgdesc="A versatile simulator for generic mobile robots simulation based on Blender. Blender 2.49 branch."
arch=('i686' 'x86_64')
url="http://morse.openrobots.org/"
license=('custom')
depends=('blender<2.50' 'python2' 'python2-yarp')
provides=('morse')
makedepends=('git' 'cmake')

_gitroot="git://github.com/laas/morse.git"
_gitname="morse"
_gitbranch="BLENDER_249_STABLE"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin $_gitbranch
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
    cd $_gitname && git checkout -t origin/$_gitbranch
  fi

  cd ../

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  msg "Start making..."

  rm -fr build
  mkdir build
  cd build

  cmake ../$_gitname -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7/ -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DCMAKE_BUILD_TYPE=Release -DBUILD_YARP2_SUPPORT=ON -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir/" install

  install -d "${pkgdir}/usr/share/morse"

  mv "${pkgdir}/usr/bin/morse" "${pkgdir}/usr/bin/morse2"
  echo "#!/bin/bash" > "${pkgdir}/usr/bin/morse"
  echo "export PYTHONPATH=\$PYTHONPATH:/usr/lib/python2.7/site-packages/morse/blender" >> "${pkgdir}/usr/bin/morse"
  echo "exec morse2" >> "${pkgdir}/usr/bin/morse"
  chmod +x "${pkgdir}/usr/bin/morse"

  install -d "${pkgdir}/usr/share/licenses/$pkgname"
  install -m644 ../$_gitname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}
