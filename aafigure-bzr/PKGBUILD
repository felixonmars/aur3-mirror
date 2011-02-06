# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=aafigure-bzr
pkgver=78
pkgrel=1
pkgdesc="ASCII art to image converter"
arch=('i686' 'x86_64')
url="http://launchpad.net/aafigure"
license=('custom')
depends=('python' 'setuptools')
source=( LICENSE.txt aafigure.1)
conflicts=('aafigure')
provides=('aafigure')
_bzrbranch=lp:aafigure
_bzrname=aafigure

build() {
  cd ${srcdir}
  msg "Connecting to BZR server..."

  if [ -d ${srcdir}/${_bzrname} ] ; then
    cd ${_bzrname} && bzr pull ${_bzrbranch}
    msg "Local repository updated."
  else
    bzr co ${_bzrbranch}
  fi
  #bzr branch ${_bzrbranch} -q -r ${pkgver}
  cd ${startdir}

  msg "BZR checkout done or server timeout"  
  install -D LICENSE.txt $startdir/pkg/usr/share/licenses/aafigure-bzr/COPYING
  install -D aafigure.1 $startdir/pkg/usr/share/man/man1/aafigure.1
  cd $startdir/src/aafigure
  python setup.py install --root=$startdir/pkg || return 1
}
md5sums=('2539d72a3354d9187f2c10acebf2e6dd'
         '82c749c825d421de0abe21c4f50c671c')
