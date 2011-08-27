# Contributor: Markus Gross
# Parts taken from avivo pkgbuild from: jonathan
# originally based on a PKGBUILD created by "billy" from archlinux.org forum
# Maintainer kfgz <kfgz at interia pl>

pkgname=xf86-video-radeonhd-git
pkgver=20101127
#pkgver=`date +%Y%m%d`
pkgrel=1
_ver=1.3.0.99
pkgdesc="Driver for AMD GPG r5xx/r6xx/r7xx Chipsets"
url="http://cgit.freedesktop.org/xorg/driver/xf86-video-radeonhd/"
arch=('i686' 'x86_64')
license=('custom')
depends=('glibc' 'ati-dri>=7.6' 'libdrm>=2.4.15' 'libpciaccess')
makedepends=('pkgconfig' 'xorg-server>=1.7.0' 'diffutils' 'mesa' 'glproto' 'git' \ 
             'automake' 'xf86driproto' 'xorg-server-devel' 'xorg-util-macros')
conflicts=('xorg-server<1.7.0' 'xf86-video-radeonhd')
provides=("xf86-video-radeonhd=${_ver}")
options=('!libtool')
install=radeonhd.install
source=(configure.patch)
md5sums=('a0f42379b6c8ebbf03b60ff6f7e67316')

_gitroot="git://anongit.freedesktop.org/git/xorg/driver/xf86-video-radeonhd"
_gitname="xf86-video-radeonhd"

build() {
  cd ${srcdir}
  msg "Connecting to git.freedesktop.org GIT server...."

  if [ -d ${srcdir}/${_gitname} ] ; then
   cd ${_gitname} && git pull origin
   msg "The local files are updated."
  else
   git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  
  cd "${srcdir}/${_gitname}"
  patch -Np1 -i ${srcdir}/configure.patch
  
  msg "Creating build directory"
  if [ -d ${srcdir}/${_gitname}-build ]; then rm -rf ${srcdir}/${_gitname}-build; fi
  cp -R ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build

  msg "Starting make..."
  cd ${srcdir}/${_gitname}-build
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_gitname}-build
  make DESTDIR=${pkgdir} install
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${_gitname}/COPYING
}
