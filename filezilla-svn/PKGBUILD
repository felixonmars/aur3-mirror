#Contributor: Flamelab <panosfilip@gmail.com>

pkgname=filezilla-svn
_realname=filezilla
pkgver=3634
_realver=3.3.1
pkgrel=1
pkgdesc="Fast and reliable FTP, FTPS and SFTP client"
arch=('i686' 'x86_64')
url="http://filezilla-project.org/"
license=('GPL')
depends=('wxgtk' 'libidn' 'hicolor-icon-theme' 'gnutls' 'dbus-core')
makedepends=('subversion')
provides=("$_realname-$_realver")
install=filezilla.install
conflicts=("$_realname")
sources=('')
md5sums=('')

_svntrunk=http://svn.filezilla-project.org/svn/FileZilla3/trunk/
_svnmod=filezilla


build() {

  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    rm -r $_svnmod
  fi
 
  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  
  msg "SVN checkout done or server timeout"
  msg "Starting make..."


  cp -r $_svnmod $_svnmod-build >/dev/null 2>&1
  cd ${srcdir}/${_svnmod}-build
  
  ./autogen.sh 
  ./configure --prefix=/usr --disable-manualupdatecheck || return 1

  make || return 1
  make DESTDIR="$pkgdir" install || return 1

  rm -r $srcdir/$_svnmod-build
}
