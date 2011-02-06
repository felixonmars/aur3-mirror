# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=adesklet-doityourself
pkgver=0.4.1
pkgrel=2
pkgdesc="A generic desklet controlled by a user-made back-end script"
url="http://adesklets.sourceforge.net/desklets.html"
arch=('any')
license=('GPL')
depends=('adesklets')
groups=('adesklet-desklets')
backup=('usr/share/adesklets/doityourself/config.txt')
source=(http://downloads.sourceforge.net/sourceforge/adesklets/doityourself-$pkgver.tar.bz2)
md5sums=('63640f9002b9c5010042da01b4346578')

package() {
  cd ${srcdir}/doityourself-$pkgver

#Python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  install -d ${pkgdir}/usr/share/adesklets/doityourself
  cp -a ${srcdir}/doityourself-$pkgver/* ${pkgdir}/usr/share/adesklets/doityourself/
  chown root:adesklets ${pkgdir}/usr/share/adesklets/doityourself
  chmod 775 ${pkgdir}/usr/share/adesklets/doityourself
}
