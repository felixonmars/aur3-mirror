# Contributor: Christian Rapp <saedelaere.tv@googlemail.com>
pkgname=tv-viewer-bzr
pkgver=179
pkgrel=3
pkgdesc="TV-Viewer is a frontend to watch and record tv. It supports analog tv and devices with a build-in hardware MPEG-2 encoder. This package provides the latest source code."
arch=('i686' 'x86_64')
url="http://tv-viewer.sourceforge.net/"
license=('GPL')
depends=('ivtv-utils' 'mplayer' 'xdg-utils' 'glibc' 'libxdmcp' 'libxau' 'libxcb' 'libx11')
makedepends=('bzr' 'wget')
optdepends=(
'tkimg: provides png support for tk < 8.6'
)
#tkimg: If using tk < 8.6 this provides png support
provides=(tv-viewer)
conflicts=(tv-viewer)
options=(!strip)

# Get correct version for CARCH
    if [ $CARCH = "i686" ]; then
		tclkit="tclkit-8.5.9"
        source=(http://downloads.sourceforge.net/project/tv-viewer/tv-viewer_tclkit/tv-viewer-0.8.2x/tclkit-8.5.9)
		md5sums=('1c5bd92adf118351522e9bbb8ffffd6e')
	fi
	if [ $CARCH = "x86_64" ]; then
		tclkit="tclkit-8.5.9-2-x86_64"
		source=(http://downloads.sourceforge.net/project/tv-viewer/tv-viewer_tclkit/tv-viewer-0.8.2x/tclkit-8.5.9-2-x86_64)
		md5sums=('a6d71ff6784543f6ccffa8d657a7809e')
	fi

_bzrtrunk=bzr://tv-viewer.bzr.sourceforge.net/bzrroot/tv-viewer/trunk
_bzrmod=trunk

build() {
  cd "$srcdir"
  msg "Connecting to tv-viewer bzr server..."

  if [ -d "$srcdir/$_bzrmod" ] ; then
    cd $_bzrmod
    bzr update
    msg "The local files are updated."
    msg "bzr checkout done or server timeout"
    msg "configuring build system..."
	chmod a+x ../${tclkit}
	cp -f ../${tclkit} extensions/tclkit/
    chmod a+x ./configure.tcl
    extensions/tclkit/${tclkit} ./configure.tcl --prefix="$pkgdir/usr" --bintarget="/usr/share/tv-viewer" --enable-tclkit=yes --nodepcheck --quiet
    msg "starting make..."
	chmod a+x ./install.tcl
    extensions/tclkit/${tclkit} ./install.tcl --quiet
  else
    bzr checkout $_bzrtrunk
    cd $_bzrmod
    msg "bzr checkout done or server timeout"
    msg "configuring build system..."
    chmod a+x ../${tclkit}
	cp -f ../${tclkit} extensions/tclkit/
    chmod a+x ./configure.tcl
    extensions/tclkit/${tclkit} ./configure.tcl --prefix="$pkgdir/usr" --bintarget="/usr/share/tv-viewer" --enable-tclkit=yes --nodepcheck --quiet
    msg "starting make..."
	chmod a+x ./install.tcl
    extensions/tclkit/${tclkit} ./install.tcl --quiet
  fi
}
