# Maintainer: Marcel Huber <`echo "moc tknup liamg tä oofrebuhlecram" | rev`>

pkgname=suisseid
pkgver=4304.477
# fileid inside archive
_pkgminor=472
pkgrel=1
pkgdesc="SuisseID SwissSign Software"
arch=('x86_64')  # 'i686' only tested for x86_64
[ "${CARCH}" = "i686" ] && _arch="i386"
[ "${CARCH}" = "x86_64" ] && _arch="amd64"
url="http://postsuisseid.ch/de/support/software"
license=('custom')
depends=('acsccid' 'pcsclite' 'pcsc-tools')
optdepends=()
install=$pkgname.install
source=(http://postsuisseid.ch/images/setup/suisseid-lin-${pkgver}.tar.bz2
        LICENSE)
sha256sums=('beec40311df964e30422dcb51dfaa37f3add2689d9c78cd3d92e7b7348a05a04'
            'de090b2db82a7fed879e897ad3296b9bae401227a1343342e6702cc5bc2526d8')

_platformPackageFile="${pkgname}-lin-${_pkgminor}-${_arch}-stable.tar.gz"
_packagesToInstall=(suisseid-pkcs11_1.0.4292-1_${_arch}.tar.gz suisseid-configuration_2.0.4235-1_${_arch}.tar.gz)

prepare() {
  rm -f "$srcdir/$pkgname"
  ln -f -s "$srcdir/${pkgname}-lin-$pkgver" "$srcdir/$pkgname"
  cd "$srcdir/$pkgname"
  tar xzf "$_platformPackageFile" --strip-components=1
}


build() {
  cd "$srcdir/$pkgname"
  local _preInstallDir="$srcdir/$pkgname/2install"
  mkdir -p "$_preInstallDir"
  for f in ${_packagesToInstall[@]}; do
    tar xzf $f -C "$_preInstallDir" --transform 's,/usr/sbin/,/usr/bin/,g' --exclude '*changelog*' --show-transformed-names;
  done
  # fix check for library in install scripts
  for f in suisseid-system-defaults.sh suisseid-user-configuration.sh; do
    sed -i 's/! test -f \${LIB}/[ -z "$LIB" -o ! -f "${LIB}" ]/' "$_preInstallDir/usr/bin/$f"
  done
}

package() {
  cd "$srcdir/$pkgname"
  local _preInstallDir="$srcdir/$pkgname/2install"
  install -d "$pkgdir"/usr/{bin,lib}
  cp -a -T "$_preInstallDir/usr/bin" "$pkgdir/usr/bin"
  cp -a -T "$_preInstallDir/usr/lib" "$pkgdir/usr/lib"
  install -D -m 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

