# Maintainer: ianux <ianux@free.fr>
pkgname=tv-maxe-svn
pkgver=174
pkgrel=1
pkgdesc="Watch TV channels on Linux"
arch=('i686' 'x86_64')
url="http://code.google.com/p/tv-maxe/"
license=('GPL')
depends=('python2' 'pygtk' 'vlc' 'mplayer' 'sopcast' 'gstreamer0.10-python' 'ffmpeg' 'python-imaging' 'python2-virtkey')
makedepends=('subversion' ''libstdc++5'')
optdepends=('lirc' 'mencoder')
conflicts=('tv-maxe' 'tvmaxe')
install=tv-maxe.install
source=(tv-maxe.desktop)
md5sums=('9af9a8a34705c3f5abba1bc619650cce')
sha1sums=(b87410db9529877d5faf3b830875ed0de8873412'')

_svntrunk=http://tv-maxe.googlecode.com/svn/trunk/
_svnmod=tv-maxe

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
}

package() {
  cd "$srcdir/$_svnmod-build"
  install -m 755 -d "$pkgdir"/usr/share/$_svnmod
  install -m 644 -D "$srcdir"/$_svnmod.desktop "$pkgdir"/usr/share/applications/$_svnmod.desktop
  install -m 755 -D $_svnmod $pkgdir/usr/bin/$_svnmod
  cp -R * "$pkgdir"/usr/share/$_svnmod
  sed -i "s|python|python2|g" $pkgdir/usr/bin/$_svnmod
}

# vim:set ts=2 sw=2 et:
