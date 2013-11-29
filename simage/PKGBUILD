# Contributor: marcus fritzsch <fritschy@googlemail.com>
# Contributor: Xyne
# Contributor: Mrbit

pkgname=simage
pkgver=1.7.0
pkgrel=4
pkgdesc="provides support for loading and saving images, sound and video"
url="http://www.coin3d.org/lib/simage"
license="GPL"

if [ "${CARCH}" = 'x86_64' ]; then
    depends=('gcc' 'libjpeg-turbo' 'libpng' 'libsm' 'libsndfile' 'libtiff' 'giflib' 'libvorbis' 'libx11' 'zlib')
 elif [ "${CARCH}" = 'i686' ]; then
    depends=('gcc-multilib' 'lib32-libjpeg-turbo' 'lib32-libpng' 'lib32-libsm' 'lib32-libsndfile' 'lib32-libtiff' 'lib32-giflib' 'lib32-libvorbis' 'lib32-libx11' 'lib32-zlib')
fi

makedepends=('gcc' 'doxygen')
arch=('i686' 'x86_64')
#source=("http://ftp.coin3d.org/coin/src/all/$pkgname-$pkgver.tar.gz")
source=("https://bitbucket.org/Coin3D/coin/downloads/$pkgname-$pkgver.tar.gz")

md5sums=('c479cc27fc80ffc39142318a233c6ae2')

build() {
  
  sed -i '326s/(setjmp(png_ptr->jmpbuf)/(setjmp(png_jmpbuf(png_ptr))/' $srcdir/$pkgname-$pkgver/src/simage_png.c
   cd -- "$srcdir"
  mkdir build
  cd build
   ../"$pkgname-$pkgver"/configure --prefix=/usr --enable-optimization \
    --enable-threadsafe --enable-html --enable-man --enable-exceptions \
    --disable-debug --with-targa --with-rgb --with-pic --with-xwd --with-eps
  make DESTDIR="$pkgdir" install
}
