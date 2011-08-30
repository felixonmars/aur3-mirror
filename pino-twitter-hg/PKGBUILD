# Maintainer Renzo Carbonara <gnuk0001@gmail.com>
# Old Maintainer Emanuele Rossi <newdna1510 at yahoo dot it>

pkgname=pino-twitter-hg
pkgver=214
pkgrel=1
pkgdesc="Mercurial build of Pino Twitter Client GTK2/Vala "
arch=('i686' 'x86_64')
url="http://code.google.com/p/pino-twitter/"
license=('GPL')
depends=('vala' 'gtk2' 'libgee' 'libsoup' 'libwebkit' 'libxml2' 'intltool' 'gtkspell' 'libunique')
makedepends=('pkgconfig' 'mercurial' 'cmake')
provides=('pino-twitter-hg' 'pino-hg')
conflicts=('pino')
source=()
md5sums=()
source=('pino-construct-only-properties.patch'
	'pino-get_style_property-fix.patch')
md5sums=('7ad98756dba6596034f655724afa3f29'
         '8b327e6b21a52a62e92397dfcdd858ca')

_hgroot=https://pino-twitter.googlecode.com/hg/
_hgrepo=pino-twitter

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  #
  # BUILD HERE
  #

  patch -N -l -p1 -i $srcdir/pino-construct-only-properties.patch
  patch -N -l -p1 -i $srcdir/pino-get_style_property-fix.patch

  for i in $(find . | grep "\.py"); do
    sed "s/\#\! \/usr\/bin\/env python/\#\! \/usr\/bin\/env python2/g" -i $i
  done

  #Temporary patch
  for i in $(find src | grep "\.vala"); do
    sed "s/ Action/ Gtk.Action/g" -i $i
  done
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DUBUNTU_ICONS=OFF -DENABLE_DEBUG=OFF
  make || return 1
  make DESTDIR=$pkgdir install

  sed "s/\#\! \/usr\/bin\/env python/\#\! \/usr\/bin\/env python2/g" -i {waf,wscript}

#  ./waf configure --prefix=/usr || return 1
#  ./waf build 	|| return 1
#  ./waf --destdir=$startdir/pkg install || return 1
}


