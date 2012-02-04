# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>
 
pkgname=planeshift-svn
pkgver=2360
pkgrel=1
pkgdesc="Open source and cross-platform 3D Fantasy MMORPG"
url="http://www.planeshift.it/"
arch=('i686' 'x86_64')
license=('GPL' 'custom:PlaneShift Content License')
depends=('crystalspace-1.4branch-svn' 'cg-toolkit')
makedepends=('ftjam' 'subversion')
provides=('planeshift')
conflicts=('planeshift')
install=planeshift.install
source=(planeshift.desktop
        planeshiftsetup.desktop
        planeshiftupdater.desktop
        planeshift.license
        psclient.sh
        pssetup.sh
        psupdater.sh)
    
md5sums=('5be27f6e51c8edff591aa1fdc668b7e9'
         'e75381f677b5d2ae331d0e4e742ee21a'
         '228193984ba13ba04c983a9c8161edae'
         'dbac9cf5bfb63463bcb2b5ea09b00586'
         '845b4ac589fdf361696245b796bd12f1'
         '7f1d3fe855658817d4c0498851fb4857'
         '9852e63d7484674e330f440603c4f4ab')
 
_svntrunk=https://planeshift.svn.sourceforge.net/svnroot/planeshift/stable
_svnmod=planeshift
 
build() {
 
  #Grab the sources with svn
  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver) || return 1
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod || return 1
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  rm -r "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"
  
  #Build planeshift
  ./autogen.sh
  ./configure --prefix=/opt/PlaneShift --enable-separate-debug-info=no
  jam -q client psupdater || return 1
  
  #Planeshift installer is broken so we install manually
  mkdir -p $pkgdir/opt/PlaneShift
  cp -rt $pkgdir/opt/PlaneShift psclient pssetup psupdater psclient.cfg pssetup.cfg vfs.cfg || return 1
  
  #We create a speciall config file for the updater, that tells it NOT to overwrite our binaries
  echo "Update.Platform=false" > $pkgdir/opt/PlaneShift/psupdater.cfg
  
  #Planeshift uses the directoy its in, so we set permissions to allow games group to update and run planeshift.
  chown -R root:games $pkgdir/opt/PlaneShift || return 1
  find $pkgdir/opt/PlaneShift -type f -exec chmod 664 {} + || return 1
  find $pkgdir/opt/PlaneShift -type d -exec chmod 775 {} + || return 1
  chmod 775 $pkgdir/opt/PlaneShift/psclient $pkgdir/opt/PlaneShift/pssetup $pkgdir/opt/PlaneShift/psupdater
  
  #Copy the icons and .desktop files
  mkdir -p $pkgdir/opt/PlaneShift/support/icons
  cp support/icons/*.png $pkgdir/opt/PlaneShift/support/icons/
  install -d -m755 $pkgdir/usr/share/applications/
  install -D -m644 $srcdir/*.desktop $pkgdir/usr/share/applications/
  
  #Install the License
  install -D -m644 $srcdir/planeshift.license $pkgdir/usr/share/licenses/planeshift/COPYING
  
  #Copy the bin scripts
  install -D -m755 $srcdir/psclient.sh $pkgdir/usr/bin/psclient
  install -D -m755 $srcdir/pssetup.sh $pkgdir/usr/bin/pssetup
  install -D -m755 $srcdir/psupdater.sh $pkgdir/usr/bin/psupdater
  
}
 
# vim:set ts=2 sw=2 et:
