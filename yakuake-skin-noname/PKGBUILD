# Contributor: Juan Diego Tascon

pkgname=yakuake-skin-noname
pkgver=0.1
pkgrel=1
pkgdesc="A dark skin for Yakuake"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/A+Yakuake+skin?content=58254"
license=('LGPL')
depends=('yakuake')
source=("http://www.kde-look.org/CONTENT/content-files/58254-NoName_Yakuake.tar.gz")
md5sums=('7b5c565d7419622670f512283115ebae')

build() {
	mkdir -p ${startdir}/pkg/usr/share/apps/yakuake/skins/
	cp -r ${startdir}/src/NoName_Yakuake ${startdir}/pkg/usr/share/apps/yakuake/skins/
}

