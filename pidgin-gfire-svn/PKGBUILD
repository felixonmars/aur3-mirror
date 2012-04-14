# Contributor:  Taylor Lookabaugh <jesus dot christ dot i dot love at gmail dot com>
# Maintainer: LookTJ

pkgname=pidgin-gfire-svn
pkgver=553
pkgrel=2
pkgdesc="Plugin to Pidgin which adds Xfire network support (Dev/svn tree)"
url="http://gfireproject.org/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('glib2' 'libpurple' 'libnotify' 'gtk2')
makedepends=('subversion' 'pkgconfig' 'intltool' 'libtool')
conflicts=('pidgin-gfire')
provides=('pidgin-gfire')

source=()
md5sums=()

_svntrunk=http://svn6.assembla.com/svn/gfire/trunk/
_svnmod=gfire

build() {
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
  cd "$srcdir/$_svnmod-build"
  svn cleanup




  ./autogen.sh
  ./configure --prefix=/usr --enable-libnotify
  make
}


package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir" install
      }

# vim:set ts=2 sw=2 et:



