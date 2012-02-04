# Maintainer: Techlive Zheng <techlivezheng at gmail dot com>
# Contributor: Det <nimetonmaili@gmail.com>
# Contributor: speed145a/Jonny James <speed145a@aol.com>
# Contributor: Marius Dransfeld <marius.dransfeld@googlemail.com>

pkgname=songbird-svn
pkgver=22708
pkgrel=1
pkgdesc="An open-source customizable music player - SVN version"
arch=('i686' 'x86_64')
url="http://www.songbirdnest.com/"
license=('GPLv2')
makedepends=('subversion')
if [ "${CARCH}" = 'x86_64' ]; then
depends=('libxrender' 'libxext' 'libidl2''libx11' 'libxmu' 'libxt'
         'sqlite3' 'gtk2' 'nss'
         'lib32-gstreamer0.10'
         'lib32-gstreamer0.10-base'
         'lib32-gstreamer0.10-good')
optdepends=(
         'lib32-gstreamer0.10-bad: support for more formats'
         'lib32-gstreamer0.10-ugly: support for more formats')
else
depends=('libxrender' 'libxext' 'libidl2' 'libx11' 'libxmu' 'libxt'
         'sqlite3' 'gtk2' 'nss'
         'gstreamer0.10'
         'gstreamer0.10-base-plugins'
         'gstreamer0.10-good-plugins')
optdepends=(
         'gstreamer0.10-ffmpeg: support for more formats'
         'gstreamer0.10-bad-plugins: support for more formats'
         'gstreamer0.10-ugly-plugins: support for more formats')
fi
provides=('songbird')
conflicts=('songbird' 'songbird-bin' 'songbird-bin64' 'songbird-nightly-bin' 'bin32-songbird-nightly')
install=songbird.install
source=('songbird-launcher.sh' 'songbird.desktop' 'make-buildinfo.py.patch' 'configure.ac.patch' 'songbird.config')

_svnmod=songbird
_dependver=11909
_svntrunk=http://publicsvn.songbirdnest.com/client/trunk
_svndependencies=http://publicsvn.songbirdnest.com/vendor-binaries/trunk/linux-i686

build() {
  mkdir -p ${srcdir}/${_svnmod}

  cd ${srcdir}/${_svnmod}

  if [ -d .svn ]; then
    svn up
  else
    svn co ${_svntrunk} -r ${pkgver} .
  fi

  msg "SVN checkout done or server timeout"

  msg "Checking out dependencies"

  cd ${srcdir}/${_svnmod}/dependencies/

  if [ -d .svn ]; then
    svn up
  else
    svn co ${_svndependencies} -r ${_dependver}
  fi

  msg "SVN checkout done or server timeout"

  msg "Starting build..."

  cd ${srcdir}/${_svnmod}

  msg "Patch files..."

  #Remvoe HAL check,as the Arch Linux has no longer officially support HAL.
  #This also need set the official build flag in songbird.config,or the iPod extenstion will cause compiled failure.
  svn revert configure.ac && \
  patch -p1 configure.ac ../configure.ac.patch

  #Patch for make it working under python3
  svn revert build/make-buildinfo.py && \
  patch -p1 build/make-buildinfo.py ../make-buildinfo.py.patch

  msg "Starting make..."

  cp ../songbird.config .

  make -f songbird.mk clobber

  make -f songbird.mk
}

package() {
  cd ${srcdir}/${_svnmod}/compiled/dist

  mkdir -p ${pkgdir}/opt/songbird/

  cp -dpr --no-preserve=ownership * ${pkgdir}/opt/songbird/

  install -D -m755 ${srcdir}/songbird-launcher.sh \
           ${pkgdir}/usr/bin/songbird
  install -D -m644 ${srcdir}/songbird.desktop \
           ${pkgdir}/usr/share/applications/songbird.desktop
  install -D -m644 ${srcdir}/${_svnmod}/compiled/dist/chrome/icons/default/default.xpm \
           ${pkgdir}/usr/share/pixmaps/songbird.xpm
}
md5sums=('afc2ad4ad4954e98af3703a1a07cd574'
         '6e942a653aa7a586fbbcb1d8ceddd303'
         'e5d128dae665497566a32507ea07bbdd'
         'b15b90014dd4c0b7dd0edf07806c9884'
         'd58564f02d96ac33fc9fd952fca1e7ed')
