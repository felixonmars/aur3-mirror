# Maintainer: Eugeni Dodonov <eugeni@dodonov.net>

pkgname=glamor-git
pkgver=20120418
pkgrel=1
pkgdesc='OpenGL based 2D rendering acceleration library	'
arch=('i686' 'x86_64')
url='http://cgit.freedesktop.org/xorg/driver/glamor/'
license=('custom')
depends=('glibc' 'mesa' 'libdrm' 'xorg-server-devel' 'libx11' 'xf86driproto' 'glproto')
makedepends=('git')
provides=('glamor=0.3.1')
options=('!libtool')
md5sums=( 'ba65e71c481b94ef0fb6c23c7f21ffa1')

_gitroot='git://git.freedesktop.org/git/xorg/driver/glamor'
_gitname='glamor'

build() {
  msg 'Connecting to git.freedesktop.org GIT server....'

  if [ -d $_gitname ] ; then
    msg "Skipping git pull, do it yourself if you need"
    cd $_gitname
    git pull
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
    --prefix=/usr

  make
}

package() {
  cd $_gitname-build

  make DESTDIR="${pkgdir}" install
}
