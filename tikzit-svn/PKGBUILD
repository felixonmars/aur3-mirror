# Maintainer: 
# Contributor: max_meyer 
# Contributor: popsch
# Based on original tikzit-aur-package made by pippin
pkgname=tikzit-svn
pkgver=426
pkgrel=3
pkgdesc="Allows the creation and modification of TeX diagrams written using the pgf/TikZ macro library"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/tikzit/"
license=('GPL')
groups=()
depends=('gtk2>=2.18.0'
         'poppler-glib' 'hicolor-icon-theme' 'gnustep-base' 'desktop-file-utils')
makedepends=('gcc-objc' 'subversion')
install="tikzit.install"
provides=(tikzit)
options=()
install="tikzit.install"
md5sums=() #generate with 'makepkg -g'

_svntrunk=https://tikzit.svn.sourceforge.net/svnroot/tikzit 
_svnmod=tikzit 

build() {
  source /etc/profile.d/GNUstep.sh

  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build/trunk/tikzit"

  ./autogen.sh
  #
  # BUILD HERE
  #
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
}

package() {
#  source /etc/profile.d/GNUstep.sh
  cd "$srcdir/$_svnmod-build/trunk/tikzit"
  make "DESTDIR=$pkgdir" install || return 1
}

# vim:set ts=2 sw=2 et:
