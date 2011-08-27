# Contributor: Andreas Schönfelder <passtschu at freenet dot de>

pkgname=lastrecorder-hg
_realname=${pkgname/-*}
pkgver=47
pkgrel=2
pkgdesc="Last Recorder is a small program that can save tracks from Last.fm audio streams into separate tagged mp3 files."
arch=(any)
url="http://timka.org/lastrecorder/"
license=('GPL')
optdepends=('libglade: needed for gui'
            'pygtk: needed for gui'
            'mutagen: needed for tagging')
makedepends=('mercurial')
source=('lastrecorder.patch')
md5sums=('d345f10f3b98ab50f5f8c80873f5ff0d')

_hgroot="https://lastrecorder.googlecode.com/hg/"
_hgrepo="lastrecorder"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u || return 1
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo || return 1
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/$_realname"
  patch -p1 < "$srcdir/$_realname.patch" || return 1

  install -d "$pkgdir/usr/bin" \
    "$pkgdir/usr/share/$_realname" \
    "$pkgdir/usr/lib/python2.6/site-packages/$_realname" || return 1

  install -m755 "$srcdir/$_realname/$_realname.py" \
    "$pkgdir/usr/bin/$_realname" || return 1

  install -m644 "$srcdir/$_realname/$_realname.glade" \
    "$pkgdir/usr/share/$_realname/" || return 1
  install -m644 "$srcdir/$_realname/$_realname.png" \
    "$pkgdir/usr/share/$_realname/" || return 1

  for file in $(ls "$srcdir/$_realname/$_realname"); do
    install -m644 "$srcdir/$_realname/$_realname/$file" \
      "$pkgdir/usr/lib/python2.6/site-packages/$_realname/" || return 1
  done
} 
