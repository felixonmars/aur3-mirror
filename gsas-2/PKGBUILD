# Maintainer: Zachary A. Jones <jazzplayerl9@gmail.com>
pkgname=gsas-2
pkgver=785
pkgrel=1
pkgdesc="General Structure Analysis System II - refinement for powder diffraction patterns"
arch=(i686 x86_64)
url="https://subversion.xor.aps.anl.gov/trac/pyGSAS"
license=(unknown)
depends=(python2 python2-scipy python2-matplotlib wxpython python2-opengl python2-numpy)
[ "${CARCH}" = "x86_64" ] && depends=("${depends[@]}")
makedepends=(subversion scons gcc-fortran)
source=(GSASII.desktop
	rungsas2)

md5sums=('e9d06aed1866e65ce8259cfd5a31e1ce'
	 'c114904d9eb6130abfb83e3d23adf005')
_svntrunk="https://subversion.xor.aps.anl.gov/pyGSAS/trunk/"
_svnmod="gsas-2"
build() 
{
  mkdir -p "$pkgdir/opt/gsas2"
  mkdir -p "$pkgdir/usr/share/licenses/gsas2/"
  cd "$pkgdir/opt/gsas2"
  svn co "$_svntrunk" "$pkgdir/opt/gsas2"
  #Build Fortran components using scons
  cd "$pkgdir/opt/gsas2/fsource"
  sed -i 's/f2py/f2py2/g' SConstruct
  sed -i 's/python/python2/g' SConstruct
  scons
  cd "$pkgdir"
  mkdir -p "$pkgdir/usr/share/applications/"
  #Install Desktop files:
  install -m 644 -D "$srcdir/GSASII.desktop" usr/share/applications/GSASII.desktop
  #Install and link executables:
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/rungsas2" "$pkgdir/opt/gsas2/gsas2"
  chmod +x "$pkgdir/opt/gsas2/gsas2"
  ln -s /opt/gsas2/gsas2 usr/bin/gsas2
  #Remove SVN leftovers:
  rm -rf $(find "$pkgdir" -type d -name ".svn")
}
