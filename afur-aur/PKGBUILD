# Maintainer: Arnaud Durand-Favreau <biginoz at FREE point FR>


pkgname=afur-aur
pkgver=1.1
pkgrel=1
pkgdesc="Script for use afur-makepkg (uploading script for archlinuxfr) and upload source in AUR, it's based in aurploader"
arch=('any')
url="http://wiki.archlinux.fr/howto/archlinux/repos_archlinuxfr#afur-aur"
license=('GPL')
depends=('perl' 'afur-makepkg')
install=(afur-aur.install)
source=( afur-aur aurploader-fork makepkg.conf32 makepkg.conf64)


md5sums=('12b98b736b27a2d96c5021c65ae0945b'
         '64527ba0ceabca5980937a2f2d5daa3a'
         'a22e6465a0867ad5e67535367bf8b6d6'
         'be18421aa2e77242a0d5781c507986f1')

build() {

  cd $startdir/src
  install -d $startdir/pkg/usr/bin && \
  install -d $startdir/pkg/usr/share/afur-aur && \
  install -m 755 -o 0 -g 0 afur-aur $startdir/pkg/usr/bin
  install -m 755 -o 0 -g 0 aurploader-fork $startdir/pkg/usr/bin
  cp makepkg.conf64 $startdir/pkg/usr/share/afur-aur
  cp makepkg.conf32 $startdir/pkg/usr/share/afur-aur
}
