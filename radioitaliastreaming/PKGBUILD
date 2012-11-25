
pkgname=radioitaliastreaming
pkgver=0.6.1
pkgrel=1
pkgdesc="This Amarok script allow you to listen Italian's Radios"
url="https://opendesktop.org/content/show.php?content=153307"
arch=('any')
license=('GPL')

depends=('amarok' 'streamripper')
# Install 'mplayer2' to record to wav.file! 
# =========================================

install=$pkgname.install
source=(http://opendesktop.org/CONTENT/content-files/153307-$pkgname.amarokscript.tar.gz)
md5sums=('ca43bd2a065847b0b0519d1ad786e742')

build() {
  cd $srcdir/$pkgname.amarokscript

  install -d $pkgdir/usr/share/apps/amarok/scripts/$pkgname
  install -m644 * $pkgdir/usr/share/apps/amarok/scripts/$pkgname
}
