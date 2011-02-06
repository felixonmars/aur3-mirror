# Contributor: Krzysztof Raczkowski <raczkow@gmail.com>

pkgname=kdeicons-breathless
pkgver=1.1
pkgrel=2
pkgdesc="A collection of the most beautiful FREE FOR USE icons on the net, configured to work perfectly on KDE"
arch=(i686 x86_64)
url="http://www.kde-look.org/content/show.php/Breathless?content=60465"
license="GPL, Artistic 2.0"
makedepends=('tar' 'bzip2' 'imagemagick')
source=(ftp://ftp.prz.edu.pl/pub/archlinux/archrak/src/Breathless_${pkgver}.tar.gz
	buildset.diff)
md5sums=('c3b3782cea49ef4fd6a4292b3ab9179b'
         '582750e9ceadee234935c6bc9b356ecb')

build() {
  cd ${startdir}/src/Breathless
  patch -Np1 -i ../buildset.diff || return 1
  echo "kmenu_blue_1" > kmenuicon
  sh buildset
  rm kmenuicon

  mkdir -p ${startdir}/pkg/usr/share/icons
  tar xzf Breathless.tar.gz -C ${startdir}/pkg/usr/share/icons
}
