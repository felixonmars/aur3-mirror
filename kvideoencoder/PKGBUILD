# Contributor: Devon <admin@patched.biz>
pkgname=kvideoencoder
pkgver=0.08
pkgrel=1
pkgdesc="kvideoencoder is a GUI for the mencoder and transcode."
url="http://www.kde-apps.org/content/show.php?content=31385"
license=""
depends=(kdelibs mplayer)
makedepends=()
conflicts=()
replaces=()
backup=()
install=
#source=(http://belnet.dl.sourceforge.net/sourceforge/kvideoencoder/KVideoEncoder-0.08.tar.gz)
source=(http://dl.sourceforge.net/kvideoencoder/KVideoEncoder-$pkgver.tar.gz)
md5sums=(fac3c1e24d42a524726d1ee0406cefbf)

build() {

  cd $startdir/src/KVideoEncoder-$pkgver

  ./configure --prefix=/opt/kde --with-kde=/opt/kde/ --with-kde-includes=/opt/kde/include/ --with-kde-libraries=/opt/kde/lib/ --with-kde=/opt/kde/
   
  make || return 1
  
  /bin/install -D -m 755 $startdir/src/KVideoEncoder-$pkgver/src/kvideoencoder $startdir/pkg/usr/bin/$pkgname
  
}

