# Contributor: Carl Mueller  arch at carlm e4ward com

pkgname=kdeplasma-applets-emailnotify-svn
pkgver=61
pkgrel=1
pkgdesc="With this plasmoid is possible to check all pop3 and imap servers mail"
url="http://code.google.com/p/emailnotify/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kdebase-workspace')
makedepends=('subversion' 'automoc4' 'cmake')
install=kdeplasma-applets-emailnotify.install
conflicts=('emailnotify-plasmoid' 'emailnotify-plasmoid-svn')
provides=('emailnotify-plasmoid' 'emailnotify-plasmoid-svn')

_svntrunk="http://emailnotify.googlecode.com/svn/trunk/"
_svnmod=emailnotify

build() {
  msg "Connecting to SVN server...."

  if [ -d "$_svnmod/.svn" ]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi
  
  msg "SVN checkout done or server timeout"
  msg "Starting build..."
  
  rm -rf "${srcdir}"/build
  mkdir "${srcdir}"/build
  cd "${srcdir}"/build
  cmake ../${_svnmod} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package(){
  cd build
  make DESTDIR="${pkgdir}" install
}
