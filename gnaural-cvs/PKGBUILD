# Maintainer: Splex

pkgname=gnaural-cvs
pkgver=20110122
pkgrel=1
pkgdesc="An opensource binaural-beat generator. CVS development branch."
arch=('i686' 'x86_64')
url="http://gnaural.sourceforge.net/"
license=('GPL')
depends=('gtk2' 'libsndfile' 'portaudio' 'libglade')
provides=('gnaural')
conflicts=('gnaural' 'gnaural2' 'gnaural-bbgen')
makedepends=('cvs')
source=()
md5sums=()

_cvsroot=":pserver:anonymous@gnaural.cvs.sourceforge.net:/cvsroot/gnaural"
_cvsmod="gnaural"

build() {
  cd ${srcdir}
  msg "Connecting to the CVS server..."
  if [ -d "${srcdir}/${_cvsmod}" ] ; then
    cd ${_cvsmod} && cvs update
    msg "Local repository updated."
  else
    cvs -z3 -d ${_cvsroot} co -P ${_cvsmod}
  fi
  cd ${startdir}
  msg "CVS checkout/update done or server timeout"

  rm -rf "${srcdir}/{$_cvsmod}-build"
  cp -r "${srcdir}/${_cvsmod}" "${srcdir}/${_cvsmod}-build"
  cd "${srcdir}/${_cvsmod}-build"

  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "${srcdir}/${_cvsmod}-build"
  make DESTDIR=${pkgdir} install || return 1
}

# vim:set ts=2 sw=2 et:
