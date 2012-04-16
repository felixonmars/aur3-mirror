# Contributor: Det <nimetonmaili at gmail a-dot com>
# Contributor: <You know who you are>

pkgname=tilda-cvs
pkgver=20120416
pkgrel=1
pkgdesc="Linux terminal based on classic terminals from first person shooter games - CVS version"
arch=(i686 x86_64)
url="http://tilda.sourceforge.net"
provides=("tilda=`date +%Y%m%d`")
conflicts=('tilda')
license=('GPL')
depends=('vte' 'confuse' 'libglade')
makedepends=('gawk' 'cvs')
source=(${pkgname}.patch tilda-fix-glib-include.patch)
md5sums=('a178f911d9941cbe68731a03aa931c02'
         '1c3cb017c7aaa04c5b36acde82cbc79e')
_cvsmod="tilda"
_cvsroot=":pserver:anonymous@tilda.cvs.sourceforge.net:/cvsroot/tilda"

build() {
  if [ -d ${_cvsmod}/CVS ]; then
    msg "Starting CVS update."
    cd ${_cvsmod}
    cvs -z3 update -d
    msg "Updating finished."
    cd ..
  else
    msg "Starting (ugh) CVS checkout ..."
    cvs -z3 -d ${_cvsroot} co -D ${pkgver} -P ${_cvsmod}
    msg "Checkout done or the server timed out."
  fi

  [ -e ${_cvsmod}-build ] && rm -rf ${_cvsmod}-build
  cp -rf ${_cvsmod} ${_cvsmod}-build
  cd ${_cvsmod}-build

  msg "Applying the time fix patch"
  patch -Np0 -i ../${pkgname}.patch
  msg "Applying the glib fix patch"
  patch -p1 < ../tilda-fix-glib-include.patch
  msg "Starting make..."
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_cvsmod}-build
  make DESTDIR="${pkgdir}" install
}
