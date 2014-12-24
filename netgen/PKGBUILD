# Maintainer: Oliver Goethel <godeezy at gmail.com>
# Contributor: Thomas Zervogiannis <tzervo@gmail.com>
# Contributor: Michael Schubert <mschu.dev at gmail>

pkgname=netgen
pkgver=5.3.1
pkgrel=1
pkgdesc="An automatic 3D tetrahedral mesh generator"
url="http://www.hpfem.jku.at/netgen/"
depends=('opencascade' 'libjpeg' 'ffmpeg' 'ffmpeg-compat'
'tk-togl-legacy-netgen' 'tix')
arch=('i686' 'x86_64')
md5sums=('afd5a9b0b1296c242a9c554f06af6510'
         'b963a08af5414da040f337ac863b93e5'
         '13e3df6fa6360b120dbf6ee6a99ce558'
         '1d724002255c0819d46d23bf7da6df01')
license=('LGPL')
source=("http://downloads.sourceforge.net/netgen-mesher/${pkgname}-${pkgver}.tar.gz" 
"netgen"
"netgen5_occ65.patch"
"netgen5_ffmpeg.patch")
options=('docs' '!libtool')

build() {
  cd "${pkgname}-${pkgver}"

  patch -Np1 -i ${srcdir}/netgen5_occ65.patch
  patch -Np1 -i ${srcdir}/netgen5_ffmpeg.patch

  CXXFLAGS="-D__STDC_CONSTANT_MACROS" ./configure --prefix=/usr \
    --enable-occ -with-occ=/opt/opencascade --with-gnu-ld --enable-nglib \
    --enable-jpeglib --enable-ffmpeg --datadir=/usr/share

  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  
  install -D -m644 "$srcdir/$pkgname-$pkgver/doc/ng4.pdf" \
    "$pkgdir/usr/share/doc/$pkgname/ng4.pdf"
  mv "$pkgdir/usr/bin/netgen" "$pkgdir/usr/bin/netgen.bin"
  install -m 755 "$srcdir/netgen" "$pkgdir/usr/bin/netgen"

}
