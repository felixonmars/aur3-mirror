# Contributor: Cilyan Olowen <gaknar@gmail.com>
pkgname=python-poppler-bzr
pkgver=79
pkgrel=2
pkgdesc="Python bindings for Poppler"
url="https://launchpad.net/poppler-python"
license=('GPL')
arch=(i686 x86_64)

depends=('pygtk>=2.10.0' 'poppler-glib>=0.10')
makedepends=('bzr>=0.15' 'gnome-common')
conflicts=('poppler-python')
provides=('poppler-python=$pkgver')

source=()
md5sums=()

options=(!libtool)

_bzrtrunk='lp:~poppler-python/poppler-python/trunk'
_bzrmod='poppler-python'

build() {
  cd ${srcdir}
  
  msg "Checking out code..."
  if [ -d ${_bzrmod} ] ; then
    cd ${_bzrmod}
    bzr update
    msg "Code up-to-date."
  else
    bzr branch $_bzrtrunk $_bzrmod -r $pkgver || return 1
    msg "Checkout done."
  fi
  
  cd ${srcdir}
  rm -rf ${_bzrmod}-build
  cp -R ${_bzrmod} ${_bzrmod}-build || return 1
  
  msg "Starting make..."
  cd ${srcdir}/${_bzrmod}-build
  ./autogen.sh --prefix=/usr\
               --sysconfdir=/etc \
               --localstatedir=/var || return 1
  make || return 1
  make install DESTDIR=${pkgdir} || return 1
}
# vim:syntax=sh
