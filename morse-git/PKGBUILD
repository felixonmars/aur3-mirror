pkgname=morse-git
pkgver=20101125
pkgrel=1
pkgdesc="A versatile simulator for generic mobile robots simulation based on Blender"
arch=('i686' 'x86_64')
url="http://morse.openrobots.org/"
license=('custom')
depends=('blender-beta' 'python' 'python-yarp')
provides=('morse')
makedepends=('git' 'cmake')

_gitroot="git://github.com/laas/morse.git"
_gitname="morse"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
    cd ../
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  msg "Start making..."

  rm -fr build
  mkdir build
  cd build

  cmake ../$_gitname -DCMAKE_BUILD_TYPE=Release -DBUILD_YARP2_SUPPORT=ON -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir/" install

  install -d "${pkgdir}/usr/share/morse"

  #mv "${pkgdir}/usr/bin/morse" "${pkgdir}/usr/bin/morse2"
  #echo "#!/bin/bash" > "${pkgdir}/usr/bin/morse"
  #echo "export PYTHONPATH=\$PYTHONPATH:/usr/lib/python3.1/site-packages/morse/blender" >> "${pkgdir}/usr/bin/morse"
  #echo "exec morse2" >> "${pkgdir}/usr/bin/morse"
  #chmod +x "${pkgdir}/usr/bin/morse"

  install -d "${pkgdir}/usr/share/licenses/$pkgname"
  install -m644 ../$_gitname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}
