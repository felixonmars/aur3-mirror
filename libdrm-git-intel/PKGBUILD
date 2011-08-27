# Maintainer: Tavian Barnes <tavianator@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Antti "Tera" Oja <antti.bofh@gmail.com>

pkgname=libdrm-git-intel
pkgver=20110708
pkgrel=1
pkgdesc='Userspace interface to kernel DRM services, built from git. Compiled with --enable-intel and --disable-radeon'
arch=('i686' 'x86_64')
url='http://dri.freedesktop.org/'
license=('custom')
depends=('glibc' 'libpthread-stubs')
makedepends=('git')
provides=('libdrm=2.4.27' 'libdrm-git')
conflicts=('libdrm')
options=('!libtool')

_gitroot='git://git.freedesktop.org/git/mesa/drm'
_gitname='drm'

build() {
  msg 'Connecting to git.freedesktop.org GIT server....'

  if [ -d $_gitname ] ; then
    cd $_gitname
    git pull origin
    msg 'The local files are updated.'
  else
    git clone $_gitroot
  fi

  msg 'GIT checkout done or server timeout'

  msg 'Creating build directory'
  cd "${srcdir}"
  rm -rf $_gitname-build
  cp -R $_gitname $_gitname-build

  msg 'Starting make...'
  cd $_gitname-build

  sh autogen.sh \
    --prefix=/usr \
    --enable-udev \
    --disable-radeon \
    --enable-intel
  make
}

package() {
  cd $_gitname-build
  make DESTDIR="${pkgdir}" install
}
