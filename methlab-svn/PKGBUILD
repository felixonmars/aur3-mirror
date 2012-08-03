# Contributor: Martin Herndl <martin.herndl@gmail.com>

pkgname=methlab-svn
pkgver=139
pkgrel=1
pkgdesc="A python music library manager especially for Audacious, XMMS and MPD"
arch=('i686' 'x86_64')
url="http://methlab.thegraveyard.org"
license=('GPL')
depends=('python2' 'pygtk' 'python-pysqlite' 'sqlite3' 'tagpy')
makedepends=('subversion')
conflicts=('methlab')
provides=('methlab')
source=()
md5sums=()

_svntrunk=http://methlab.thegraveyard.org/svn/trunk
_svnmod=methlab

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

  python2 setup.py build  
  python2 setup.py install --root=$pkgdir

  # Creating .desktop file
  mkdir -p ${pkgdir}/usr/share/applications
  echo "[Desktop Entry]" > methlab.desktop
  echo "Version=0.92" >> methlab.desktop
  echo "Encoding=UTF-8" >> methlab.desktop
  echo "MultipleArgs=false" >> methlab.desktop
  echo "Terminal=0" >> methlab.desktop
  echo "Icon=/usr/share/applications/methlab/pymethlab/images/logo_64x64.png" >> methlab.desktop
  echo "Exec=/usr/share/applications/methlab/methlab" >> methlab.desktop
  echo "Categories=Application;AudioVideo;" >> methlab.desktop
  echo "Type=Application" >> methlab.desktop
  echo "Name=Methlab" >> methlab.desktop
  cp ./methlab.desktop ${pkgdir}/usr/share/applications
}
