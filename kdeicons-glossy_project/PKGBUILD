# Contributor: Krzysztof Raczkowski <raczkow@gmail.com>

pkgname=kdeicons-glossy_project
pkgver=1.0
pkgrel=2
pkgdesc="Complete system icon set for KDE"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Glossy_Project?content=55119"
license=('GPL')
makedepends=('tar' 'bzip2' 'imagemagick')
source=(ftp://ftp.prz.edu.pl/pub/archlinux/archrak/src/Glossy_Project_KDE_Iconset_by_hammergom.zip)
md5sums=('2e2589e4b2ae5a0c59fd589b2cd432c4')

build() {
  cd ${startdir}/src/Glossy_Crystal
  sh buildset

  mkdir -p ${startdir}/pkg/usr/share/icons
  tar xjf Glossy_Project.tar.bz2 -C ${startdir}/pkg/usr/share/icons
}
