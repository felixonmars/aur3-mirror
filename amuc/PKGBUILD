# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=amuc
pkgver=1.7
pkgrel=4
pkgdesc="Amuc is a Linux application for composing and playing music."
arch=(i686 x86_64)
url="http://members.chello.nl/w.boeke/amuc/"
license=('GPL')
depends=('glibc' 'libx11' 'alsa-lib' 'jack-audio-connection-kit')
makedepends=('libxft' 'cairo')
groups=()
source=(http://members.chello.nl/w.boeke/amuc/$pkgname-$pkgver.tar.gz amuc.desktop)


md5sums=('6e26398207e243b408f2d41f82fcbdbc'
         '0948afebc1f73de4e47b0152340d51e7')


build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
 sed -i -e "s/\/usr\/share/..\/..\/pkg\/usr\/share/g" $startdir/src/$pkgname-$pkgver/Makefile
  make || return 1
  make tr-sco
  #mv $startdir/src/$pkgname-$pkgver/src-tr-sco/tr-sco $startdir/src/$pkgname-$pkgver/src-tr-sco/wav2score 
  SDIR=$startdir/pkg/usr/share
  mkdir -p $SDIR/amuc
  mkdir -p $startdir/pkg/bin
  mkdir -p $SDIR/doc/amuc
  mkdir -p $startdir/pkg/usr/share/man/man1
  make INSTALL_DIR=$SDIR/amuc BIN_DIR=$startdir/pkg/bin DOC_DIR=$SDIR/doc/amuc install

	#desktop file
	
	install -D -m644 $srcdir/../amuc.desktop $pkgdir/usr/share/applications/amuc.desktop
  #make INSTALL_DIR=$startdir/pkg/amuc install || return 1
}

