# Maintainer: alorewotik <paraparapampam@gmail.com>

pkgname=zcomp-git
pkgver=20110410
pkgrel=1
pkgdesc="Compiz without WM feature"
url="http://git.compiz.org/~tuxmarkv/zcomp/"
license=('GPL' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
depends=('librsvg' 'mesa' 'boost-libs' 'libwnck' 'gconf')
makedepends=('git' 'intltool' 'pkgconfig' 'boost' 'cmake')
conflicts=('compiz-core-git' 'compiz-core' 'compiz-core++' 'compiz' 'compiz-decorator-gnome' 'compiz--decorator-kde')
provides=('compiz-core++' 'compiz-core-git')
replaces=('compiz-core++' 'compiz-core-git')
source=(compiz-no-gdk_display.patch)
md5sums=('28f435200f68b99a2b20c44e202e2040')
options=(!libtool !emptydirs)

_gitroot="git://anongit.compiz.org/users/tuxmarkv/zcomp"
_gitname="zcomp"

build() {
  msg "Connecting to the GIT server...."

  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
    cp compiz-no-gdk_display.patch $_gitname
    cd $_gitname
    patch -Np0 -i compiz-no-gdk_display.patch
  fi

  msg "GIT checkout done"
  msg "Starting make..."

  [[ -d build ]] || mkdir build
	cd build
	env cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCOMPIZ_DESTDIR=$pkgdir
  make || return 1
  make install || return 1
	_cmake_root=$(sed -n 's/CMAKE_ROOT:INTERNAL=//p' CMakeCache.txt)
	mkdir -p "${pkgdir}${_cmake_root}/Modules"
  make findcompiz_install || return 1
  cd ..
  for _license in COPYING{,.GPL,.LGPL,.MIT} ; do
    install -D -m644 ${_license} "${pkgdir}/usr/share/licenses/${pkgname}/${_license}"
  done
}
