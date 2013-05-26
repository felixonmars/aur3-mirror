# Mantained by: Jens Staal <staal1978@gmail.com>

pkgname=p9p-de
pkgver=20130526
pkgrel=2
pkgdesc="Using plan9port as a desktop environment or Rio as window manager"
arch=('any')
url="http://swtch.com/plan9port/screenshots/rio.png"
# Sources used for the design of the package:
# http://www.nuxified.org/image/a_little_schizophrenia_plan9port_on_arch_gnu_linux
# 
#

license=('custom:MIT')
depends=('plan9port')
optdepends=('abaco')
source=('plan9port.desktop' 'rio.desktop' 'p9p-de' 'rio-de' 'riostart.rc')
md5sums=('32e97ccccf4c29ded084f5986be2aeef ' '52f2bc4d3d8e59a3a6717293e484517c' \
'9aaceecb59b43ee3da062b72eff1eff3' 'a27b432668b32b81a39e82bd0d51d83a' \
'8bb12453b18448ab6dbb0e47e9c63285')
options=('!strip' 'emptydirs')

# The package contains 2 .desktop files
# rio.desktop only starts rio as a WM and does not change PATH, default shell or editor
# plan9port.desktop starts a complete plan9port environment
# The aim with plan9port environment is to make use of all cool stuff like factotum etc.
# riostart.rc is a system-wide default setting for rio.
# at first start, a local copy in ./~ should be generated and then this one takes presedence.

build() {
      msg "generating package directories"
      mkdir -p ${pkgdir}/usr/share/xsessions
      mkdir -p ${pkgdir}/usr/bin
      mkdir -p ${pkgdir}/etc/skel

      msg "copying files to proper directories"     
      cp ${srcdir}/{p9p-de,rio-de} ${pkgdir}/usr/bin/
      chmod +x ${pkgdir}/usr/bin/*
      cp ${srcdir}/{plan9port,rio}.desktop ${pkgdir}/usr/share/xsessions/
      cp riostart.rc ${pkgdir}/etc/skel/
      }


