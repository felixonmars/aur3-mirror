# Mantainer: Košava <kosava@archlinux.us>

pkgname=mib-ossigeno-icons
_pkgname=MIB-Ossigeno-Ultimate-Icons
pkgver=4.3
pkgrel=1
pkgdesc="Icon theme from Mandriva International Backports inspirated in KDE4 Oxygen theme"
arch=('any')
url="http://mib.pianetalinux.org/mib/"
license=('GPL')
source=("http://mib.pianetalinux.org/MIB/2010.2/others/projects/MIB-Ossigeno-Ultimate/Tarball/MIB-Ossigeno-Ultimate-Icons.tar.gz")
md5sums=('dc4fb4afef87ca908e47393e48e0d3b1')

build() {
  cd $srcdir
  install -d $pkgdir/usr/share/icons/
  cp -R ${_pkgname} ${pkgdir}/usr/share/icons/${_pkgname}
}