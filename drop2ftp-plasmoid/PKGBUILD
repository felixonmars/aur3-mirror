# Contributor: Fedor Suchkov <f.suchkov@gmail.com>

pkgname=drop2ftp-plasmoid
pkgver=0.6
pkgrel=1
pkgdesc="This is a KDE 4 plasma applet which can copy files with every protocol which is supported by KIO. So you can use it to copy files to a FTP server or an folder on your PC for example."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php?content=97281"
license=('GPL3')
groups=()
depends=('kdebase-workspace>=4.2')
makedepends=('gcc' 'cmake' 'automoc4')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://www.kde-look.org/CONTENT/content-files/97281-drop2ftp-$pkgver.tar.gz")
noextract=()
md5sums=('af94ed317b52648c12ec4481e4345618')
build() {
  cd "$srcdir/drop2ftp-$pkgver"
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr .. || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}

