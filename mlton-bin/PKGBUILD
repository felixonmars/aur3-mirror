# Maintainer: Ben Darwin <implode (map chr [98,99,100,97,114,119,105,110,64,103,109,97,105,108,46,99,111,109])>

pkgname=mlton-bin
pkgver=20130715
pkgrel=2
pkgdesc="binary package for the MLton whole-program, optimizing SML compiler"
arch=('i686' 'x86_64')
url="http://mlton.org/"
license=('custom:BSD-like')	# http://mlton.org/License
depends=('gmp' 'bash' 'perl')
provides=('sml' 'mlton')
conflicts=('mlton-static')
options=('staticlibs')

if [ "${CARCH}" = 'x86_64' ]; then
  _arch="amd64"
  sha256sums=('f6f912009b0946b73af88ff5f3e713b6be63b871696e2697ccf1564b56e7d03b'
              'e0f6d88bff89afea3ad35575c6dfca14809b5129d5b23730927a89bc0b48db47')
elif [ "${CARCH}" = 'i686' ]; then
  _arch="x86"
  sha256sums=('92d89627cf760c56d0e9727f328b006341bf5be283fc7d616a6276c26d95b2cf'
              'e0f6d88bff89afea3ad35575c6dfca14809b5129d5b23730927a89bc0b48db47')
fi

source=("http://sourceforge.net/projects/mlton/files/mlton/$pkgver/mlton-$pkgver-1.${_arch}-linux.tgz" "LICENSE")

package() {
  cd $srcdir

  _prefixdir="usr/"

  for d in "bin" "lib" "share";
  do
    mkdir -p "$pkgdir/$_prefixdir/$d"
    cp -a "$_prefixdir/$d" "$pkgdir/$_prefixdir"
  done

  mkdir -p "$pkgdir/$_prefixdir/share/man"
  cp -a "$_prefixdir/man/" "$pkgdir/$_prefixdir/share/"

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
