pkgname=okular-git-viewerinterface
pkgver=20110930
pkgrel=1
pkgdesc='KDE document viewer (from experimental viewerinterface git branch, used by kile-git-livepreview)'
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde.org/"
depends=('kdebase-runtime' 'qimageblitz' 'poppler-qt' 'chmlib' \
	 'djvulibre' 'ebook-tools' 'libspectre')
makedepends=('git' 'automoc4' 'cmake')
conflicts=('kdegraphics-okular')
provides=('kdegraphics-okular')
groups=('kde4-git')

_gitroot="git://anongit.kde.org/okular.git -b viewerinterface"
_gitname="okular"

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
  if [[ -d ${srcdir}/${_gitname}-build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/${_gitname}-build
  fi
  mkdir $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build
  cmake $startdir/src/$_gitname -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/$_gitname-build
  make DESTDIR=${pkgdir} install
}