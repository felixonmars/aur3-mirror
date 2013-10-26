# Maintainer: Ebenezer Edelman <contact@EbenezerEdelman.tk>

pkgname=fadein-demo
pkgver=1.2.452
pkgrel=1
pkgdesc="Professional screenwriting software."
arch=(i686 x86_64)
url="http://www.fadeinpro.com/"
license=(unknown)
depends=(atk glibc cairo fontconfig freetype2 glib gtk2 pango libstdc++5 libx11 libpng12)

if [[ "$CARCH" = "i686" ]]; then
  _arch="i386"
  md5sums=("b9742eaf577a95163f8f6a6cae7cc712")
elif [[ "$CARCH" = "x86_64" ]]; then
  _arch="amd64"
  md5sums=("9f2672bd4c54dacbc80b33ea55496da2")
fi

_srcfile="fadein-linux-${_arch}-demo.tar.gz"
source=("http://www.fadeinpro.com/download/demo/${_srcfile}")

package() {
  cp -r "$srcdir"/* "$pkgdir"
  rm "$pkgdir/${_srcfile}"
}

# vim:set ts=2 sw=2 et:
