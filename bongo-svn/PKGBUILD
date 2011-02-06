# Contributor: Stefan Lohmaier <noneuss_AT_gmail_DOT_com
pkgname=bongo-svn
pkgver=527
pkgrel=1
pkgdesc="Bongo is an easy-to-use mail and calendar system, offering a simple yet powerful user interface. The goal is to make sharing, organisation, and communication simpler, quicker, and more useful."
arch=(i686 x86_64)
url="http://www.bongo-project.org/"
license=('GPL')
depends=(bison openldap gnutls popt python doxygen flex apache mod_python)
makedepends=()
install=bongo-svn.install
source=(bongo.sh)
md5sums=('2d8b41a6bebc4ad156625f24c77b939f')

_svntrunk=http://svn.gna.org/svn/bongo/branches/remove-mdb
_svnmod=bongo

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -r $startdir/src/$_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  #
  # BUILD
  #
  ./autogen.sh
  ./configure --prefix=/opt/bongo --with-user=bongo
  make || return 1
  make DESTDIR=$startdir/pkg/ install

  # SCRIPTS
  mkdir -p $startdir/pkg/etc/rc.d $startdir/pkg/usr/lib/python2.5/site-packages
  install -m755 ../bongo.sh $startdir/pkg/etc/profile.d

  # PYTHON needs to find bongo
  ln -s /opt/bongo/lib/python2.5/site-packages/bongo  $startdir/pkg/usr/lib/python2.5/site-packages
  ln -s /opt/bongo/lib/python2.5/site-packages/libbongo  $startdir/pkg/usr/lib/python2.5/site-packages
}
