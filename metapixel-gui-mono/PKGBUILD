
# See http://wiki.archlinux.org/index.php/Arch_CVS_&_SVN_PKGBUILD_guidelines
# for more information on packaging from SVN sources.

# Contributor: mrbit >
pkgname=metapixel-gui-mono
name=MetaPixelGUI
pkgver=3544
pkgrel=1
pkgdesc="metapixel-gui .NET/mono"
arch=('any')
url="https://ptl.sys.virginia.edu/msg8u/Personal/Applications/MetaPixelGUI/"
license=('GPL2')
depends=('metapixel' 'mono')
makedepends=('subversion')
checkdepends=()
install=
#source=()
noextract=()
#md5sums=()

_svnmod="code"
_svntrunk="https://ptl.sys.virginia.edu/msg8u/Personal/Applications/MetaPixelGUI"

build() {
 cd $startdir/src
 mkdir -p ~/.subversion; touch ~/.subversion/servers
 msg "Connecting to $_svnmod.sourceforge.net SVN server...."
 svn co $_svntrunk $_svnmod -r $pkgver

 cd ./$_svnmod
#  msg "Starting make..."

  mdtool build -c:Release || exit 1

echo  $pkgdir
  install -D -m755 /$srcdir/$_svnmod/$name/bin/Release/$name.exe /$pkgdir/usr/bin/$name.exe
  install -D $startdir/MetaPixelGUI.desktop $pkgdir/usr/share/applications/kde4/MetaPixelGUI.desktop
  
  msg "Start --> mono /usr/bin/MetaPixelGUI.exe"
}
