# Maintainer: w0dash <w0dash95@googlemail.com>
pkgname=devkitpsp
pkgver=r16.1
pkgrel=5
pkgdesc="A PSP development kit"
arch=('x86_64')
url="http://devkitpro.org/index.php"
license=('GPL')
source=(http://downloads.sourceforge.net/project/devkitpro/devkitPSP/devkitPSP_r16-1-x86_64-linux.tar.bz2)
md5sums=(2b17cf8fae2fd8f9b61ff263f3d44987) 
options=(!strip)

package() {
  mkdir -p $pkgdir/opt/devkitpro
	cp -rf $srcdir/devkitPSP $pkgdir/opt/devkitpro
  
  msg "##########################################################################"
  msg "Please add these variables in your execution environment (~/.bashrc):"
  msg "export DEVKITPRO=/opt/devkitpro"
  msg "export DEVKITPSP=/opt/devkitpro/devkitPSP"
  msg "##########################################################################"
}

# vim:set ts=2 sw=2 et:
