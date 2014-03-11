pkgname=node-webkit-0.8.4
_pkgname=${pkgname%-*}
pkgver=0.8.4
pkgrel=1
pkgdesc="node-webkit is an app runtime based on Chromium and node.js."
arch=("i686" "x86_64")
url="https://github.com/rogerwang/node-webkit"
license=("MIT")
depends=("alsa-lib" "gconf" "gtk2" "nss")
optdepends=("nodejs: npm package support"
"nw-gyp: native add-on build tool for node-webkit")

if [ "$CARCH" = "i686" ]; then
  _arch="ia32"
  sha256sums=('d74241aeb876f9114642c426de447dccd2257e65f8732d0e06f05965fdbd5d89')
fi
if [ "$CARCH" = "x86_64" ]; then
  _arch="x64"
  sha256sums=('91229edfb03349306c5ce101fdab2de55f7473cc7c36367e9611a0527d2ef591')
fi

source=( "https://s3.amazonaws.com/${_pkgname}/v${pkgver}/${_pkgname}-v${pkgver}-linux-${_arch}.tar.gz" )

package() {
  msg2 "create path and copy files"
  mkdir -p $pkgdir/usr/{lib/${_pkgname}-${pkgver},bin}
  cp -R $srcdir/${_pkgname}-v${pkgver}-linux-${_arch}/* $pkgdir/usr/lib/${_pkgname}-${pkgver}/
  
  msg2 "symlink /usr/bin/nw-${pkgver} -> /usr/lib/${_pkgname}-${pkgver}/nw"
  ln -s "/usr/lib/${_pkgname}-${pkgver}/nw" "$pkgdir/usr/bin/nw-${pkgver}"

  msg2 "symlink /usr/bin/nwsnapshot-${pkgver} -> /usr/lib/${_pkgname}-${pkgver}/nwsnapshot"
  ln -s "/usr/lib/${_pkgname}-${pkgver}/nwsnapshot" "$pkgdir/usr/bin/nwsnapshot-${pkgver}"
}

