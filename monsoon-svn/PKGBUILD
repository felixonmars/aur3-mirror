# Maintainer: Hyperair <hyperair@gmail.com
pkgname=monsoon-svn
pkgver=105059
pkgrel=1
pkgdesc="A Gtk# BitTorrent client"
arch=(i686 x86_64)
url="http://monsoon-project.org"
license=('MIT')
depends=('mono>=1.2.4'
         'gtk-sharp-2>=2.10'
	 'gnome-sharp'
	 'ndesk-dbus-glib')
provides=('monsoon')
conflicts=('monsoon')
source=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=http://anonsvn.mono-project.com/source/trunk/monsoon
_svnmod=monsoon

build() {
  export MONO_SHARED_DIR="$srcdir/.wapi"
  mkdir -p "$MONO_SHARED_DIR"

  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  svn export $_svnmod $_svnmod-build
  cd $_svnmod-build

  #
  # BUILD
  #
  ./autogen.sh --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$startdir/pkg/ install

  rm -rf "$MONO_SHARED_DIR"
}
