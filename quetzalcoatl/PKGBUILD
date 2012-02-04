# Maintainer: linopolus <linopolus@xssn.at>
# Contributor: linopolus <linopolus@xssn.at>
pkgname=quetzalcoatl
pkgver='-latest' # note: if the pkgver had been '0.99-10' then use an underscore. like '0.99_10'
pkgrel=1
pkgdesc="Quetzalcoatl is a KDE4 music player client for the MPD music server. It targets the KDE4 platform and is written in Python."
arch=(i686 x86_64)
url="http://www.vcn.bc.ca/~dugan/quetzalcoatl.html"
license=('GPL3')
groups=
provides=
depends=('pyqt' 'python-mpd-git' 'kdebindings-python')
makedepends=('subversion')
_svnroot='http://quetzalcoatl-client.googlecode.com/svn/trunk/ quetzalcoatl-client-read-only'

build() {
  cd $srcdir/
  svn checkout $_svnroot
  cd quetzalcoatl-client-read-only
  mkdir -p $pkgdir/usr/bin
  cp quetzalcoatl.py $pkgdir/usr/bin/quetzalcoatl
}
