# Contributor: mrbug <devmrbug/at/gmail-dot-com>

pkgname="dvdtube-svn"
pkgver=20100311
pkgrel=1
pkgdesc="Python script to archive a YouTube user's uploads to DVD -- development version"
arch=('i686' 'x86_64' 'ppc')
provides=('dvdtube')
license=('GPL3')
url="http://code.google.com/p/dvdtube/"
depends=('python' 'youtube-dl' 'python-gdata' 'python-feedparser' 'videotrans' 'kaa-svn')
makedepends=('subversion')
md5sums=()
_svntrunk=http://dvdtube.googlecode.com/svn/trunk 

build() {
  cd $startdir/src
  msg "Updating dvdtube SVN..."
  svn co $_svntrunk || return 1
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  cd $startdir/src/trunk || return 1
  install -m 755 -D dvdtube.py $startdir/pkg/usr/bin/dvdtube || return 1
  install -m 644 -D COPYING $startdir/pkg/usr/share/licenses/dvdtube/COPYING || return 1
  install -m 644 -D README $startdir/pkg/usr/share/licenses/dvdtube/README || return 1
  }
