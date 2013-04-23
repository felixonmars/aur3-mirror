# Maintainer: Ben Darwin <implode (map chr [98,99,100,97,114,119,105,110,64,103,109,97,105,108,46,99,111,109])>

pkgname=mlton-static
pkgver=20100608
pkgrel=1
pkgdesc="static binary package for the MLton whole-program, optimizing SML compiler"
arch=('i686' 'x86_64')
url="http://mlton.org/"
license=('custom')	# BSD-like: http://mlton.org/License
depends=('perl' 'bash')
provides=('sml' 'mlton')
conflicts=()

if [ "${CARCH}" = 'x86_64' ]; then
  _arch="amd64"
  md5sums=('546b8941c35a93df4866ef91129e0f35'
           '9796787fcf04c08ddbe1ebbba0e35b94')
elif [ "${CARCH}" = 'i686' ]; then
  _arch="x86"
  md5sums=('dc6101f8923b23cd2875a74e353f520e'
           '9796787fcf04c08ddbe1ebbba0e35b94')
fi

source=("http://sourceforge.net/projects/mlton/files/mlton/$pkgver/mlton-$pkgver-1.${_arch}-linux.static.tgz" "LICENSE")

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
