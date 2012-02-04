# Contributor: Daniel Kozák <kozzi11@gmail.com>

pkgname=kdvdcreator
_realname=KDVDCreator
pkgver=0.3.1
pkgrel=1
pkgdesc="Easy to use application to create video DVDs and CDs (VCD, sVCD or CVD), suitables for home players, from any number of video files, in any of the formats supported by Mplayer."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/KDVDCreator?content=73014"
license=('GPL')
depends=('mplayer' 'dvdauthor' 'imagemagick' 'kdelibs4')
makedepends=('cmake')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$_realname.$pkgver.tar.gz)
md5sums=('65d9e4ca0fb02d766c9cc6f598400edb')

build() {
  cd $startdir/src/$_realname.$pkgver
  [ -f /etc/profile.d/kdemod4.sh ] && . /etc/profile.d/kdemod4.sh
  [ -f /etc/profile.d/kde4.sh ] && . /etc/profile.d/kde4.sh
  cmake . -DCMAKE_INSTALL_PREFIX:PATH=`kde4-config --prefix` || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
