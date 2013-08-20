# Contributor: 
# Maintainer: CtHx

pkgname=psimedia-plus-git
pkgver=20130807
pkgrel=1
pkgdesc="Voice and video chat plugin for Psi-like IM clients. The implementation is based on GStreamer. Patched by Psi-plus team."
arch=('i686' 'x86_64')
license=('GPL2')
url="http://code.google.com/p/psi-dev/"
depends=( 'speex' 'gstreamer0.10-base-plugins' 'qt4'  'liboil' 'gstreamer0.10-good-plugins')
makedepends=('pkgconfig' 'qconf' 'git')
conflicts=('psimedia')
provides=('psimedia')
source=('git+https://github.com/psi-plus/psimedia.git')
md5sums=('SKIP')

_gitname="psimedia"

pkgver() {
  cd ${srcdir}/${_gitname}
  git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {

  cd ${srcdir}/${_gitname}

  qconf || return 1
  ./configure || return 1
  make || return 1
}

package() {

  install -D -m644 ${srcdir}/${_gitname}/gstprovider/libgstprovider.so ${pkgdir}/usr/lib/psi-plus/plugins/libgstprovider.so
    
  #symlink for psi users
  install -d -m755 ${pkgdir}/usr/lib/psi/plugins/
  ln -s /usr/lib/psi-plus/plugins/libgstprovider.so ${pkgdir}/usr/lib/psi/plugins/libgstprovider.so
}

