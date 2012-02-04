#Maintainer: Adriano Foschi <adriano.src@gmail.com>

pkgname=wayland-libdrm-git
pkgver=20090921
pkgrel=1
pkgdesc="Userspace interface to kernel DRM services patched for Wayland display server"
arch=('i686' 'x86_64')
depends=('glibc')
options=('!libtool')
url="http://dri.freedesktop.org/"
license=('custom')
depends=('libpthread-stubs')
replaces=('libdrm>=2.4.12')
provides=('libdrm' 'libdrm-git' 'libdrm=2.5.0')
conflicts=('libdrm' 'libdrm-git')
groups=('xorg')
source=(libdrm-page-flip.diff)

_gitroot="git://git.freedesktop.org/git/mesa/drm"
_gitname="drm"

build() {

 msg "Connecting to git.freedesktop.org GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

cd $startdir/src/$_gitname

patch -Np1 -i "${srcdir}/libdrm-page-flip.diff" || return 1

  cd ${startdir}/src/drm
  sh autogen.sh --prefix=/usr \
  --enable-nouveau-experimental-api \
  --enable-radeon-experimental-api \
  --enable-udev || return 1 
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}

md5sums=('71d83cc4274c21c269ae8faad41848a7')
