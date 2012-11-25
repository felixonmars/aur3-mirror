# Maintainer: wido <widomaker2k7@gmail.com>

pkgname=tvdownloader-hg
pkgver=228
pkgrel=1
pkgdesc="Software to retreive podcasts and videos from French websites.(Mercurial version)"
url="http://code.google.com/p/tvdownloader/"
provides=('tvdownloader')
conflicts=('tvdownloader' 'tvdownloader-svn')
depends=('msdl' 'python2' 'python2-qt' 'rtmpdump' 'pycrypto' 'python2-mechanize')
makedepends=('mercurial')
license=('GPL2')
arch=('any')
source=()
md5sums=()

_hgroot="https://tvdownloader.googlecode.com/hg/"
_hgrepo=tvdownloader

build() {
  msg "Connecting to tvdownloader.googlecode.com server...."

  if [ -d "$_hgrepo" ] ; then
    cd "$_hgrepo"
    hg pull -u || return 1
    msg "The local files are updated."
else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg "tvdownloader.googlecode.com checkout done or server timeout"
  msg "Starting make..."
  
  cd $srcdir
  
  rm -rf "$_hgrepo-build"
  hg clone "$_hgrepo" "$_hgrepo-build"

	cd ${srcdir}/${_hgrepo-build}/other/Stable/
    # Compile
    make PYTHON_VERSION=python2.7
}

package() {
	cd ${srcdir}/${_hgrepo-build}/other/Stable
    make PYTHON_VERSION=python2.7 PREFIX=$pkgdir/usr install
}
