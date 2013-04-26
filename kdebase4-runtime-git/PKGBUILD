pkgname=kdebase4-runtime-git
_gitname=kde-runtime
pkgver=v4.10.2.278.gcddf56b
pkgrel=1
pkgdesc='A library to access Open Collaboration Service providers'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('LGPL')
depends=('kdelibs4-git' 'smbclient' 'libssh' 'libcanberra' 'oxygen-icons' 'xorg-xauth' 'kactivities-git')
makedepends=('cmake' 'automoc4' 'kdepimlibs4-git' 'openslp' 'doxygen' 'networkmanager')
optdepends=('kdepimlibs4-git: to generate drkonqi reports'
            'htdig: to build the search index in khelpcenter'
            'rarian: needed by khelpcenter'
            'gdb: drkonq crash handler')
conflicts=('kdebase-runtime')
provides=('kdebase-runtime')
groups=('kde-git')
source=('git://anongit.kde.org/kde-runtime')
md5sums=('SKIP')
install=kdebase4-runtime-git.install

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $srcdir
  
  msg "GIT checkout done"
  msg "Starting make..."
  if [[ -d ${srcdir}/build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/build
  fi
  mkdir $srcdir/build
  cd $srcdir/build
  cmake $srcdir/$_gitname -DCMAKE_BUILD_TYPE=debugfull \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DWITH_QNtrack=OFF \
		-DSAMBA_INCLUDE_DIR=/usr/include/samba-4.0 \
		-DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
  rm -f "${pkgdir}/usr/share/icons/hicolor/index.theme"
  ln -sf /usr/lib/kde4/libexec/kdesu "${pkgdir}/usr/bin/"
}
