# Contributor: gothicknight <gothicknight@gmail.com>

# ------------------------------------------------------------------ Package Description
pkgname=pyeu-svn
pkgver=193
pkgrel=1
pkgdesc="e-U wifi and wireless GUI connection manager"
url="http://gcx.ipg.pt"
license="GPL"
arch=(i686)

# ------------------------------------------------------------------ Package Management
depends=(python pygtk pygobject wireless_tools wpa_supplicant)
conflicts=(pyeu-svn)
provides=(pyeu-svn)
makedepends=('subversion dhclient')

_svnmod="pyeu"
_svntrunk="http://pye-u.googlecode.com/svn/trunk/"

# ------------------------------------------------------------------ Files
source=()
md5sums=()

# ------------------------------------------------------------------ Build and instalation
build() {
  cd $startdir/src
  touch ~/.subversion
  msg "Connecting to $_svnmod.googlecode.com SVN server...."
  svn co $_svntrunk ./ -r $pkgver 

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  cd $startdir/src/

  # Remove useless files
  msg "Removing docs"
  rm -rf debian RPM ebuild
  rm -rf *.txt TODO Changelog Makefile pye-u

  # Installing Icons
  mkdir -p $startdir/pkg/usr/share/applications
  mkdir -p $startdir/pkg/usr/share/pixmaps
  install -m644 $startdir/src/pye-u.desktop $startdir/pkg/usr/share/applications/
  install -m644 $startdir/src/tray.png $startdir/pkg/usr/share/pixmaps/

  # Creating Directories
  mkdir -p $startdir/pkg/opt/pye-u/
  mkdir -p $startdir/pkg/usr/bin/

  cp * $startdir/pkg/opt/pye-u/
  echo "#!/bin/bash" > $startdir/pkg/usr/bin/pye-u
  echo "python /opt/pye-u/pye-u.py" >> $startdir/pkg/usr/bin/pye-u
  chmod +x $startdir/pkg/usr/bin/pye-u

}
