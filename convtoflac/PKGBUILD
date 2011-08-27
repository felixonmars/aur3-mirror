# Contributor: Roman Ajsin <aysin.roman@gmail.com>
pkgname=convtoflac
pkgver=2.1.3
pkgrel=1
pkgdesc="The Convert to FLAC script converts audio files compressed with alternative lossless codecs (Monkey's Audio, Shorten, etc.) to the FLAC format."
arch=('i686' 'x86_64')
url="http://www.legroom.net/software/convtoflac"
license=('unknown')
depends=('sed' 'flac')
makedepends=('gcc' 'yasm' 'pacman>=3.3.0' 'patch' 'make')
optdepends=('ffmpeg: optional decoder'
            'alac_decoder: used to decompress ALAC (Apple Lossles) files' 
            'libmp4v2: used to read tags from ALAC (Apple Lossles) files' 
            'mac: used to decompress APE (Monkeys Audio) files' 
            'shorten: used to decompress Shorten files' 
            'ttaenc: used to decompress TTA (True Audio) files' 
            'wavpack: used to decompress WavPack files'
            'trash-cli: used to send input files to trash')
provides=('apeinfo')
source=(http://www.legroom.net/files/software/$pkgname.sh \
        http://www.legroom.net/files/software/apeinfo11_source.tgz \
	      http://www.legroom.net/files/software/mac-3.99-u4-b5.tar.gz \
	      gcc4_errors.patch)
md5sums=('f60964892b43af4c63bad676150c006d'
         '108476a3ec2e9d909dc0810204a2cbe9'
         '75716b342e07deae58f56a2522362006'
         '771c071831871fe8803d139a56515e86')

build() {
  # Build mac with apeinfo
  cp "$srcdir/"{Makefile.am,Makefile.in,apeinfo.cpp} "$srcdir/mac-3.99-u4-b5/src/Examples/Analyze/Sample1/" || return 1
  cd "$srcdir/mac-3.99-u4-b5"
  
  # Applying patch from "mac 3.99u4b5-4" PKGBUILD (by stonecrest)
  patch -Np1 -i $startdir/src/gcc4_errors.patch || return 1

  # make apeinfo
  ./configure --prefix=/usr --disable-shared --enable-static          
  make || return 1
}

package() {
  mkdir -p "$pkgdir/usr/bin" || return 1
  install -m755 "$srcdir/mac-3.99-u4-b5/src/Examples/Analyze/Sample1/apeinfo" "$pkgdir/usr/bin"
  install -m755 "$srcdir/convtoflac.sh" "$pkgdir/usr/bin/convtoflac"
}

# vim:set ts=2 sw=2 et:
