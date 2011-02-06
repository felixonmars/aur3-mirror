# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Hilton Medeiros <medeiros.hilton AT gmail DOT com>
pkgname=ogre-hg
pkgver=1978
pkgrel=1
pkgdesc="A scene-oriented, flexible 3D engine written in C++"
arch=('i686' 'x86_64')
url='http://www.ogre3d.org'
license=('MIT')
depends=('boost' 'freeimage' 'freetype2' 'libxaw' 'libxrandr' 
         'nvidia-cg-toolkit' 'mesa' 'zziplib' 'ois')
makedepends=('cmake' 'mercurial')
optdepends=('cppunit: unit testing'
            'doxygen: generate API docs'
            'dot2tex: generate API docs'
            'intel-tbb: better threading support'
            'poco: portability')
conflicts=('ogre')
provides=('ogre')
replaces=('ogre-svn')
install=ogre.install
source=()
md5sums=()

_hgbranch=http://bitbucket.org/sinbad/ogre/
_hgrepo=ogre

build() {
  cd ${srcdir}

  if [ -d ${_hgrepo} ]; then
    (cd ${_hgrepo} && hg pull -u) || return 1
  else
    hg clone ${_hgbranch} || return 1
  fi

  msg "Mercurial clone done or server timeout"
  msg "Starting make..."

	rm -rf ${_hgrepo}-build
  cp -r ${_hgrepo} ${_hgrepo}-build
  cd ${_hgrepo}-build

  cmake . \
 	 -DCMAKE_INSTALL_PREFIX=/usr \
	 -DOGRE_INSTALL_PLUGINS_HEADERS=TRUE \
	 -DOGRE_INSTALL_SAMPLES=TRUE \
	 -DOGRE_INSTALL_DOCS=TRUE \
	 -DOGRE_INSTALL_MEDIA=TRUE \
	 -DOGRE_INSTALL_SAMPLES_SOURCE=TRUE

  make || return 1 # OGRE has a lot of source files. 
  # Make sure your makepkg.conf has the appropiate "-jN" option for your CPU 
  # type (-j3 for dualcore, -j5 for quadcore).

  # Check for optdepends and then attemt to generate docs
  if [[ $(which dot) && $(which doxygen) ]]; then
    make doc 2>/dev/null || return 1
  fi
  make DESTDIR=${pkgdir} install || return 1

  # Fix up samples
  install -dm777 ${pkgdir}/opt/OGRE/samples/
  mv ${pkgdir}/usr/share/OGRE/*.cfg ${pkgdir}/opt/OGRE/samples/
  mv ${pkgdir}/usr/bin/SampleBrowser ${pkgdir}/opt/OGRE/samples/
  echo "#!/bin/bash" > ${pkgdir}/usr/bin/OgreSampleBrowser
  echo "cd /opt/OGRE/samples && ./SampleBrowser" >> ${pkgdir}/usr/bin/OgreSampleBrowser
  chmod +x ${pkgdir}/usr/bin/OgreSampleBrowser
}
# vim:set ts=2 sw=2 et:

