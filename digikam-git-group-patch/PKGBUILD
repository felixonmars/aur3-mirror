pkgname=digikam-git-group-patch
pkgver=0.1
pkgrel=1
pkgdesc='Digital photo management application for KDE'
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.digikam.org/"
depends=('kdebase-runtime' 'kdepimlibs' 'libgphoto2' 'opencv' 'liblqr'
         'libkipi-git' 'libkexiv2-git' 'libkdcraw-git' 'libkface-git' 'libkgeomap-git' 'lensfun' 
	 'libpgf' 'libbaloo4')
optdepends=('kipi-plugins: more tools and plugins' 'kdebase-workspace: Theme configuration dialog')
conflicts=('digikam')
provides=('digikam')
install=digikam-git.install
source=('digikam-patch-20150119.patch::https://bugsfiles.kde.org/attachment.cgi?id=90531' 'git://anongit.kde.org/digikam.git')
md5sums=('716646691b0f6dd887e1000dc787809c' 'SKIP')

pkgver() {
  cd digikam
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
if [[ -d ${srcdir}/build ]]; then
      msg "Cleaning the previous build directory..."
      rm -rf ${srcdir}/build
  fi
  mkdir ${srcdir}/build
  cd ${srcdir}/digikam
  patch -p1 -i ../digikam-patch-20150119.patch 
}

build() {
  cd ${srcdir}/build
  cmake  ../digikam -DCMAKE_BUILD_TYPE=Release \
		-DKDE4_BUILD_TESTS=OFF \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DDIGIKAMSC_USE_PRIVATE_KDEGRAPHICS=OFF \
		-DDIGIKAMSC_USE_PRIVATE_SHAREDLIBS=ON
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
