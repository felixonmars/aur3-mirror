# Contributor: Matthew Tompsett
# Maintainer: max.bra <max.bra at alice dot it>

pkgname=jupiter-support-eee
pkgver=0.0.13
pkgrel=2
pkgdesc="Simple, easy to use hardware and power management applet for all i386 and x86_64 Linux laptops, and netbooks (EeePC Support)"
url="http://sourceforge.net/projects/jupiter"
license=('none')
makedepends=('rpmextract')
depends=('jupiter')
optdepends=('gnome-system-monitor: A system monitor for GNOME')
arch=('any')
source=(http://sourceforge.net/projects/jupiter/files/${pkgname}-${pkgver}-4.noarch.rpm)
md5sums=('b8c58842e739723dd6275ff9908c919b')
install=${pkgname}.install

build() {
  rpmextract.sh *.rpm
  cp -R ${srcdir}/{etc,usr} ${pkgdir}/
}
