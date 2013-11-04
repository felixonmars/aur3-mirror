# Maintainer: Fernando Munoz <f[at]beford.net>
# Contributor: Gen2ly <dirk.r.gently[at]gmail.com>

pkgname=liveusb-creator-git
pkgver=20111113
pkgrel=2
pkgdesc="Cross-platform tool for easily installing live operating systems on to USB flash drives."
arch=('i686' 'x86_64')
url="https://fedorahosted.org/liveusb-creator/"
license=('GPL2')
makedepends=('git')
depends=('dosfstools' 'isomd5sum' 'pyparted' 'python2' 'python2-pyqt' 'p7zip' 'syslinux' 'mtools' 'urlgrabber' 'udisks' )
source=()

_gitroot="git://git.fedorahosted.org/liveusb-creator.git"
_gitname="liveusb-creator"

build() {
  cd ${srcdir}
  msg "Connecting to git.fedorahosted.org GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
    else
    git clone $_gitroot
  fi

  msg 'Patching for python2'
  
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" $(find ${srcdir} -name '*.py')

  sed -i -e "s|#![ ]*/usr/bin/python|#!/usr/bin/python2|" ${srcdir}/$_gitname/liveusb-creator
	
  cd ${srcdir}/$_gitname/

  python2 ./setup.py build
  python2 ./setup.py install --root=${pkgdir} 

}

