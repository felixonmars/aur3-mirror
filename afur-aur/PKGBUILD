# Maintainer: Arnaud Durand-Favreau <biginoz at FREE point FR>


pkgname=afur-aur
pkgver=1.2
pkgrel=1
pkgdesc="Script for use afur-makepkg (uploading script for archlinuxfr) and upload source in AUR, it's based in aurploader"
arch=('any')
url="http://wiki.archlinux.fr/howto/archlinux/repos_archlinuxfr#afur-aur"
license=('GPL')
depends=('perl' 'afur-makepkg' 'aurploader')
install=(afur-aur.install)
source=( afur-aur makepkg.conf32 makepkg.conf64)
    
md5sums=('6d9956cf918ab37100c65b0c63017a47'
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
