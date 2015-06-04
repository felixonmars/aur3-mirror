# Maintainer: Alexander Bauer <sasha@linux.com>
# Contributor: Gökhan Sarı <me@th0th.me>

pkgname=sencha-cmd
pkgver=5.1.3.61
pkgrel=1
pkgdesc="A cornerstone to build your Sencha application."
url="http://www.sencha.com/products/sencha-cmd"
arch=('x86_64' 'i686')
license=('custom')
depends=('jre7-openjdk')
optdepends=('ruby1.9: for SCSS support')

if [ "${CARCH}" = "x86_64" ]; then
  _sencha_installer=SenchaCmd-$pkgver-linux-x64.run
  md5sums=('b0f5336cbffb9e5def7fb3ab331b7b2f')
else
  _sencha_installer=SenchaCmd-$pkgver-linux.run
  md5sums=('8bec08464d416a5e84da5e3c9d8fb87b')
fi

source=("http://cdn.sencha.com/cmd/${pkgver}/${_sencha_installer}.zip")

build() {
  chmod +x $_sencha_installer
}

package() {
  cd "${srcdir}"
  ./$_sencha_installer --mode unattended --prefix $pkgdir/opt
  install -Dm644 "$pkgdir/opt/Sencha/Cmd/$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm $pkgdir/opt/Sencha/Cmd/$pkgver/{LICENSE,sencha-$pkgver,uninstall,Uninstall\ Sencha\ Cmd.desktop}
  mkdir -p $pkgdir/usr/bin/

  cat > "$pkgdir/usr/bin/sencha-cmd" <<EOF
#!/bin/sh
/opt/Sencha/Cmd/$pkgver/sencha \$@
EOF

  chmod +x "$pkgdir/usr/bin/sencha-cmd"
}

# VIM:SET TS=2 SW=2 ET:
