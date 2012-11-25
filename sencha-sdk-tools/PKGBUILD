# Maintainer: petRUShka <petrushkin[at]yandex[dot]ru>
pkgname=sencha-sdk-tools
pkgver=2.0.0_beta3
_pkgver=2.0.0-beta3
pkgrel=4
pkgdesc="The Sencha SDK Tools is a suite of powerful tools that automate a large part of the application creation, development and building process."
url="http://www.sencha.com/products/sdk-tools/"
arch=('x86_64' 'i686')
license=('SENCHA TOOLS LICENSE v1.2')
depends=()
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
#install='foo.install'

if [ "${CARCH}" = "x86_64" ]; then
  _sencha_installer=SenchaSDKTools-$_pkgver-linux-x64.run
  md5sums=('05233ec0a1250be92a0b6c9e8f9a03ff')
else
  _sencha_installer=SenchaSDKTools-$_pkgver-linux.run
  md5sums=('5e22ed9d1f0e9b1532eab92661e6c7af')
fi

source=("http://cdn.sencha.io/sdk-tools/$_sencha_installer")

build() {
#  cd "${srcdir}/"
  chmod +x $_sencha_installer
}

package() {
  cd "${srcdir}"
  mkdir $pkgdir/opt/
  _prefix=/opt/Sencha/SDKTools
  ./$_sencha_installer --mode unattended --prefix $pkgdir$_prefix || true
  install -Dm644 "$pkgdir$_prefix/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  mkdir -p $pkgdir/usr/bin/
  cat > "$pkgdir/usr/bin/sencha-sdk-tools" <<DELIM
#!/bin/sh
$_prefix/sencha \$@
DELIM
  chmod o+x "$pkgdir/usr/bin/sencha-sdk-tools"
}

# vim:set ts=2 sw=2 et:
