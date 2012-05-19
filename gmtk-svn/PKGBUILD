# Contributor: Alexander De Sousa <archaur.xandy21@spamgourmet.com>
 
pkgname=gmtk-svn
pkgver=116
pkgrel=1
pkgdesc='Support library for gnome-mplayer and gecko-mediaplayer, development code.'
arch=('i686' 'x86_64')
url='http://gmtk.googlecode.com/'
license=('GPLv2')
depends=('dconf' 'glib2' 'gtk3')
makedepends=('intltool' 'pkg-config' 'subversion')
provides=('gmtk')
 
_svntrunk=http://gmtk.googlecode.com/svn/trunk
_svnmod=gmtk
 
build() {
  cd "$srcdir"
 
  msg2 "Checking out the repository..."
  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi
 
 
  msg2 "SVN checkout done or server timeout."
 
  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"
 
  msg2 "Configuring..."
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-gtk3 \
    --enable-gsettings
  msg2 "Building..."
  make
}
 
package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir" install
}
