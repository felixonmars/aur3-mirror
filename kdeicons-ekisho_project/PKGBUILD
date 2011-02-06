# Contributor: Krzysztof Raczkowski <raczkow@gmail.com>

pkgname=kdeicons-ekisho_project
pkgver=1.0
pkgrel=2
pkgdesc="Complete system icon set for KDE"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Ekisho_Project?content=55588"
license="GPL"
makedepends=('tar' 'bzip2' 'imagemagick')
source=(ftp://ftp.prz.edu.pl/pub/archlinux/archrak/src/Ekisho_Project_by_hammergom.zip)
md5sums=('c6b0a366fcee4d7bc26888bc574e2768')

build() {
  cd ${startdir}/src/Ekisho_Crystal
  sh buildset

  mkdir -p ${startdir}/pkg/usr/share/icons
  tar xjf Ekisho_Project.tar.bz2 -C ${startdir}/pkg/usr/share/icons
}
