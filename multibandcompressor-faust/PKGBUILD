# Maintainer : Antonio Orefice <xt7player@gmail.com>

pkgname=multibandcompressor-faust
_realname=multibandcompressor-faust
pkgver=1.0.0
pkgrel=1
pkgdesc="A mono/stereo ladspa multiband compressor written in Faust"
arch=('any')
url="https://github.com/kokoko3k/MultibandCompressor-faust"
license=('gpl')

depends=('ladspa')

source=('http://wpage.unina.it/aorefice/mbcomp_dist/multibandcompressor-faust-$pkgver/MultibandCompressor_mono.dsp.cpp' \
        'http://wpage.unina.it/aorefice/mbcomp_dist/multibandcompressor-faust-$pkgver/MultibandCompressor_stereo.dsp.cpp' \
        'http://wpage.unina.it/aorefice/mbcomp_dist/multibandcompressor-faust-$pkgver/headers/faust.tar.gz')

md5sums=('00391a3d9554754b16c6834902577d35'
         '594dde74f216343866478a5698f2b189'
         '8c86d6f8353e1d36428f0e9d85d7e1cd')

build() {
  cd ${srcdir}/

	tar -xvf faust.tar.gz || return 1
	g++ -O3 -march=native -mfpmath=sse -msse -msse2 -msse3 -ffast-math -fPIC -shared -I./ -Dmydsp=MultibandCompressor_mono MultibandCompressor_mono.dsp.cpp -o MultibandCompressor_mono.so || return 1
	g++ -O3 -march=native -mfpmath=sse -msse -msse2 -msse3 -ffast-math -fPIC -shared -I./ -Dmydsp=MultibandCompressor_stereo MultibandCompressor_stereo.dsp.cpp -o MultibandCompressor_stereo.so || return 1
}

package() {
  mkdir -p ${pkgdir}/usr/lib/ladspa/	
  install  ${srcdir}/MultibandCompressor_mono.so ${pkgdir}/usr/lib/ladspa/MultibandCompressor_mono.so
  install  ${srcdir}/MultibandCompressor_stereo.so ${pkgdir}/usr/lib/ladspa/MultibandCompressor_stereo.so
}
