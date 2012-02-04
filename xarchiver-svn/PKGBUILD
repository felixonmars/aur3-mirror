# Contributor: VuDu <vudu 'dot' curse 'at' gmail 'dot' com>

pkgname=xarchiver-svn
pkgver=42
pkgrel=1
pkgdesc="A lightweight desktop independent archive manager built with the GTK+2 toolkit"
arch=('any')
license=('GPL2')
groups=
url="http://xarchiver.sourceforge.net/"
depends=('desktop-file-utils' 'gtk2' 'hicolor-icon-theme')
makedepends=('intltool' 'pkgconfig' 'subversion')
options=('!libtool')
conflicts=('xarchiver')
provides=('xarchiver')
install=(${pkgname}.install)
source=(${pkgname}.install)
md5sums=('6abc60b8363b3b061baa4ac0b2408fb6')

_svntrunk="http://xarchiver.svn.sourceforge.net/svnroot/xarchiver/trunk"
_svnmod=xarchiver

build() {
  cd ${startdir}/src

  msg "Starting SVN checkout..."
  
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}

# vim:syntax=sh
