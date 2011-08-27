# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Your Name <muna@stcomp.cz>
pkgname=stereozoom2
pkgver=4
pkgrel=1
pkgdesc="stereo pictures viewer"
arch=(i686)
url="http://stereozoom2.sourceforge.net"
license=('GPL')
groups=()
depends=('devil' 'allegro')
makedepends=('subversion' 'autoconf')
provides=('stereozoom2')
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'a

_svntrunk=https://stereozoom2.svn.sourceforge.net/svnroot/stereozoom2/stereozoom2/trunk
_svnmod=stereozoom2

build() 
{
  cd $startdir/src
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn -r $pkgver up)
    else
    svn co -r $pkgver $_svntrunk $_svnmod 
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

#  ./autogen.sh
  autoreconf -isf
  
  ./configure --prefix=/usr --disable-gui # gui requires wxwidgets and doesn't comply with the KISS philosophy :-)
  make || return 1
  make DESTDIR=$startdir/pkg/ install

  rm -rf $startdir/src/$_svnmod-build
}

# vim:set ts=2 sw=2 et:
