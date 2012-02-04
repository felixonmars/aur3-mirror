# Contributor: Stephen Sugden < glurgle |at| gmail |dot| com >

pkgname=mingus-svn
pkgver=477
pkgrel=1
pkgdesc="A music theory and notation package for Python"
arch=('i686' 'x86_64')
url="http://mingus.googlecode.com"
license=('GPL')
depends=('python')
makedepends=('autoconf' 'automake' 'gettext' 'imagemagick' 'intltool' 'subversion') 
optdepends=('lilypond: for generating sheet music',
						'fluidsynth: for realtime MIDI playback support')
provides=("${pkgname%-svn}")
conflicts=("${pkgname%-svn}")

_svntrunk=http://mingus.googlecode.com/svn/trunk/
_svnmod=${pkgname%-svn}
_revnumber=$pkgver

build() {
  cd $srcdir/
  msg "Connecting to SVN server...."
  svn co $_svntrunk --config-dir ./ -r $_revnumber $_svnmod

  msg "SVN checkout done or the server timed out"

  # Copy files to build directory
  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  python setup.py install --root="$pkgdir"
  install -d "$pkgdir/usr/share/doc/$_svnmod"
  mv "$pkgdir/usr/mingus_examples" "$pkgdir/usr/share/doc/$_svnmod/"
}
