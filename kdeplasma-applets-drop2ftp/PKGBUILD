# Contributor: Fedor Suchkov <f.suchkov@gmail.com>

pkgname=kdeplasma-applets-drop2ftp
pkgver=0.6
pkgrel=1
pkgdesc="A KDE 4 plasma applet which can copy files with every protocol which is supported by KIO. So you can use it to copy files to a FTP server or an folder on your PC for example."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php?content=97281"
license=('GPL3')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('drop2ftp-plasmoid')
replaces=('drop2ftp-plasmoid')
source=("http://www.kde-look.org/CONTENT/content-files/97281-drop2ftp-$pkgver.tar.gz"
        'qt47.patch')
md5sums=('af94ed317b52648c12ec4481e4345618'
         'e266c41ad50833e91f236148e94d1368')

build() {
  cd drop2ftp-$pkgver
  patch -p0 -i "${srcdir}"/qt47.patch
  cd ..
  
  mkdir build
  cd build
  cmake ../drop2ftp-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
