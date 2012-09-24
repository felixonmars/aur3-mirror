pkgname=kdebase4-kate-git
true && pkgname=('kdebase4-katepart-git' 'kdebase4-kwrite-git' 'kdebase4-kate-git')
pkgver=20120924
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL')
source=('pkgbuild-syntax-highlight.patch')
md5sums=('bb189857e6d917ee8f9ecebab38c1b70')
makedepends=('cmake' 'git' 'automoc4' 'kdelibs4-git')
groups=('kde4-git' 'kdebase4-git')

_gitroot="git://anongit.kde.org/kate"
_gitname="kate"

build() {
  cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."
  if [[ -d ${srcdir}/build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/build
  fi
  git clone $srcdir/$_gitname $srcdir/build
  cd $srcdir/build
  patch -p1 -i "${srcdir}"/pkgbuild-syntax-highlight.patch
  mkdir $srcdir/build/build
  cd $srcdir/build/build
  cmake ../ -DCMAKE_BUILD_TYPE=debugfull \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_KTEXTEDITOR=OFF
  make
}

package_kdebase4-katepart-git() {
  pkgdesc="A fast and feature-rich text editor component"
  depends=('kdelibs4-git')
  url="http://kate-editor.org/about-katepart/"
  install='kdebase4-git.install'

  cd "${srcdir}"/build//build/part
  make DESTDIR="${pkgdir}" install
}

package_kdebase4-kwrite-git() {
  pkgdesc="Text Editor"
  depends=('kdebase4-runtime-git' 'kdebase4-katepart-git')
  conflicts=('kdebase-kwrite')
  install='kdebase4-git.install'

  cd "${srcdir}"/build/build/kwrite
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}"/build/build/doc/kwrite
  make DESTDIR="${pkgdir}" install
}

package_kdebase4-kate-git() {
  pkgdesc="Advanced Text Editor"
  depends=('kdebase4-runtime-git' 'kdebase4-katepart-git')
  optdepends=('kdebase-konsole-git: open a terminal in Kate')
  conflicts=('kdesdk-kate')
  install='kdebase4-git.install'

  cd "${srcdir}"/build/build/kate
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}"/build/build/doc/kate
  make DESTDIR="${pkgdir}" install
}

url='http://kate-editor.org/'
pkgdesc='Text Editor'
