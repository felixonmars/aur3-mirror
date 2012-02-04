# Contributor: Juanma Hernández <juanmah@gmail.com>

pkgname=swac-tools
pkgver=0.5
pkgrel=6
pkgdesc="Swac Tools is a set of programs that allows to get the most of words audio collections (SWAC)"
arch=('i686' 'x86_64')
url="http://shtooka.net/soft/swac-tools/en/"
depends=('bzip2' 'gtkmm' 'gconfmm' 'gstreamer0.10' 'gstreamer0.10-base' 'gstreamer0.10-good-plugins' 'libid3tag' 'flac' 'libvorbis' 'sqlite3')
provides=('swac-tools')
license=('GPL')
source=(http://shtooka.net/soft/swac-tools/download/swac-explore-0.4.1.tar.gz
	http://shtooka.net/soft/swac-tools/download/swac-get-0.5.tar.gz
	http://shtooka.net/soft/swac-tools/download/swac-play-0.2.tar.gz
	http://shtooka.net/soft/swac-tools/download/swac-scan-0.2.tar.gz
	cstdio.patch)
md5sums=('1b60aaf33c4b24e75eb2dfe607e19bc1'
	'5950732d01af2b10b139fd15f1ae37e2'
	'775c02bb996b6ad27277afe333006baf'
	'30fd4bd036ac690aaed44eb35da689e0'
	'd04cb31815c46388cb922f7f65d58b53')

build() {

  cd $srcdir
  msg "Applying patch..."
 
  mv  $srcdir/../cstdio.patch $srcdir
  patch -Np0 -i $srcdir/cstdio.patch || return 1
  mv  $srcdir/cstdio.patch ..

  cd $srcdir/swac-explore-0.4.1
  msg "Compiling SWAC Explore..."

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  cd $srcdir/swac-get-0.5
  msg "Compiling SWAC Get..."

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  cd $srcdir/swac-play-0.2
  msg "Compiling SWAC Play..."

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  cd $srcdir/swac-scan-0.2
  msg "Compiling SWAC Scan..."

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1

}
