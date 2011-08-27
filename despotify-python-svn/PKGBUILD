#Contributor: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=despotify-python-svn
pkgver=515
pkgrel=1
pkgdesc="Python bindings for an open source client for Spotify"
arch=('i686' 'x86_64')
url="http://despotify.sourceforge.net/"
license=('GPL2')
depends=('despotify-svn' 'python2')
makedepends=('subversion')
_svntrunk=https://despotify.svn.sourceforge.net/svnroot/despotify/src
_svnmod=despotify

build() {
  cd "$srcdir"
  if [ -d "$_svnmod/.svn" ]; then
    (cd "$_svnmod" && svn up)
  else
    svn co "$_svntrunk" --config-dir ./  "$_svnmod"
  fi
  msg "SVN checkout done or server timeout"

  cd "$_svnmod"

  msg "Building..."

  # Install the Python bindings
  cd bindings/python
   python2 setup.py install --prefix="/usr" --root="$pkgdir"
}
