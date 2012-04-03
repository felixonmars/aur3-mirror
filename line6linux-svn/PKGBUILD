# Maintainer: s1gma <s1gma@mindslicer.com>

pkgname=line6linux-svn
pkgver=927
pkgrel=2
pkgdesc="A collection of software to use Line6 devices under linux"
arch=('i686' 'x86_64')
url="http://www.tanzband-scream.at/line6/"
license=('GPL')
depends=('perl')
makedepends=('subversion' 'linux-headers' 'lyx')
provides=('line6linux')
install='line6usb.install'
source=('driverdocs.pdf'
        'linux3.2.patch')
md5sums=('8229eaa7e5986951452995d20dbc0a60'
         '1b5f50110dd955347fdad4c6dea3bb43')

_svntrunk=https://line6linux.svn.sourceforge.net/svnroot/line6linux/driver/trunk
_svnmod=line6usb

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  
  patch -p1 < linux3.2.patch

  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  make
}

package() {
  cp driverdocs.pdf "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir" install-only
}
md5sums=('8229eaa7e5986951452995d20dbc0a60'
         '57be55b6a232b807d3178a3c954807f9')
md5sums=('8229eaa7e5986951452995d20dbc0a60'
         '8c53ec1c370f8694e1cbea390386f4a2')
md5sums=('8229eaa7e5986951452995d20dbc0a60'
         '651fbf871faf6686271ccd23f4489d20')
