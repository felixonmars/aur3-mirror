# Maintainer: RetroX <classixretrox@gmail.com>
pkgname=lateralgm-svn
pkgver=500
pkgrel=6
pkgdesc="An interface to create projects for YoYoGame's Game Maker."
pkglongdesc=\
"LateralGM IDE

An interface to create projects for YoYoGame's Game Maker."
pkgdebsection="devel"
arch=('any')
url="http://www.ismavatar.com/lgm"
license=('GPL')
depends=('java-runtime')
debdepends=('java-runtime')
makedepends=('subversion' 'eclipse-ecj' 'java-batik' 'java-batik-rasterizertask' 'svnkit' 'apache-ant')
provides=('lateralgm')
_svntrunk="https://lateralgm.svn.sourceforge.net/svnroot/lateralgm/LateralGM/trunk"
_svnmod="lgm"
source=(lateralgm)
md5sums=(9cd68560017a784ac092a2a50718ca85)

build()
{
  svn co $_svntrunk $_svnmod
  cd $_svnmod

  rm -f lgm*.jar
  ant jar-bin -lib /usr/share/java/batik -lib /usr/share/java/svnkit -lib /usr/share/java/eclipse-ecj.jar -lib /usr/share/java/ecj.jar -Dbuild.compiler=org.eclipse.jdt.core.JDTCompilerAdapter
}

package()
{
  install -m755 -D $srcdir/lateralgm $pkgdir/usr/bin/lateralgm
  install -m644 -D $srcdir/$_svnmod/lgm*.jar $pkgdir/usr/share/java/lateralgm/lateralgm.jar
}
