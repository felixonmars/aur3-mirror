# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=python2-pygtkhelpers-hg
pkgver=279
pkgrel=1
pkgdesc="Helper library providing easy interaction with PyGTK"
arch=('i686' 'x86_64')
url="http://packages.python.org/pygtkhelpers"
license=('custom')
depends=('pygtk')
makedepends=('mercurial')
# Do you get 404 errors if you use the standard "_hgroot" and "_hgrepo"?
__hgroot=http://bitbucket.org/aafshar/pygtkhelpers-main
__hgrepo=pygtkhelpers

build() {
  cd $srcdir

  msg "Connecting to $__hgroot"
  if [ -d $__hgrepo ]; then
    cd $__hgrepo
    hg pull -u || return 1
    msg2 "Finished updating the local repository!"
  else
    hg clone $__hgroot $__hgrepo || return 1
    msg2 "Initial pull complete!"
  fi

  rm -rf ${srcdir}/${__hgrepo}-build
  cp -a ${srcdir}/${__hgrepo} ${srcdir}/${__hgrepo}-build || return 1
  cd ${srcdir}/${__hgrepo}-build

  python2 setup.py install --root=$startdir/pkg/ --prefix=/usr
}
