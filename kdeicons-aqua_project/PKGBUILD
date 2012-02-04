# Contributor: Krzysztof Raczkowski <raczkow@gmail.com>

pkgname=kdeicons-aqua_project
pkgver=1.0
pkgrel=2
pkgdesc="Complete system icon set for KDE"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Aqua_Project?content=55120"
license=('GPL')
makedepends=('tar' 'bzip2' 'imagemagick')
source=(ftp://ftp.prz.edu.pl/pub/archlinux/archrak/src/Aqua_Project_KDE_iconset_by_hammergom.zip)
md5sums=('fc7ef330124d40cdf7ab4e33761063e3')

build() {
  cd ${startdir}/src/Aqua_Crystal
  sh buildset

  mkdir -p ${startdir}/pkg/usr/share/icons
  tar xjf Aqua_Project.tar.bz2 -C ${startdir}/pkg/usr/share/icons
}
