#Maintainer: Tehacjusz Flovus (thc_flow) <thc@weedsmoker.im>

pkgname=wayland-mesa-git-bin
pkgver=20101106
pkgrel=1
pkgdesc='Mesa OpenGL Library from GIT repository, replaced AUR git dependencies with packages from repository and removed gl-manpages.'
url='http://www.mesa3d.org'
license=('custom')
arch=('x86_64' 'i686')
depends=('libgl' 'glproto' 'libdrm' 'dri2proto' 'libxxf86vm>=1.1.0' 'libxdamage>=1.1.2' 'expat>=2.0.1' 'libxmu>=1.0.5' 'libx11>=1.3.2' 'libxt>=1.0.7' 'libxext>=1.1.1' 'gcc-libs>=4.4.2')
makedepends=('git' 'pkgconfig' 'makedepend')
optdepends=('mesa-demos-git: for mesa demos (glxinfo, glxgears, ...)')
conflicts=('mesa-apps' 'mesa')
provides=('mesa=7.8.2' 'mesa-git')
options=('!makeflags')
source=('LICENSE')
md5sums=('5c65a0fe315dd347e09b1f2826a1df5a')

_gitroot='git://anongit.freedesktop.org/mesa/mesa'
_gitname='mesa'

build() {
  msg 'Connecting to git.freedesktop.org GIT server....'
  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
  else
    git clone ${_gitroot}
  fi
  msg 'GIT checkout done or server timeout'
  msg 'Starting make...'

  # Work around a problem in LDFLAGS
  export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"

  cd ${srcdir}

  # Cleanup and prepare the build dir
  [ -d build ] && rm -rf build
  cp -r ${_gitname} build
  cd build

  msg 'Applying patches'
  # Revert "intel: sync to vblank by default"
  # This reverts commit e9bf3e4cc9a7e4bcd4c45bd707541d26ecdf0409.
  sed -i -e 's/DRI_CONF_VBLANK_ALWAYS_SYNC/DRI_CONF_VBLANK_DEF_INTERVAL_0/g' src/mesa/drivers/dri/intel/intel_screen.c

  ./autogen.sh \
    --prefix=/usr \
    --with-dri-driverdir=/usr/lib/xorg/modules/dri \
    --enable-glx-tls \
    --with-driver=dri \
    --enable-xcb \
    --disable-glut \
    --enable-gallium-nouveau \
    --enable-gallium-llvm \
    --enable-egl \
    --enable-gles2

  msg 'Starting actual compile. Go get some coffee...'

  make

  msg 'Building man pages'

#  cd ${srcdir}/gl-manpages-1.0.1

#  ./configure --prefix=/usr

#  make
}

package() {
  cd build

  make DESTDIR=${pkgdir} install

  rm -f ${pkgdir}/usr/lib/libGL.so*
  rm -rf ${pkgdir}/usr/lib/xorg
  rm -f ${pkgdir}/usr/include/GL/glut*

  install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
