# Maintainer: Shalygin Konstantin (k0ste@opentech.ru)

pkgname='browser-plugin-spice'
pkgver='2.8.90'
pkgrel='4'
pkgdesc='XPI client for interacting with SPICE servers. This package contains a mozilla browser client for interacting with SPICE servers. It is also known as spice-xpi on some platforms.'
arch=('i686' 'x86_64')
url='http://spice-space.com/'
license=('GPL' 'LGPL' 'BSD')
depends=('firefox' 'spice')
conflicts=('spice-xpi')

if [[ "$CARCH" == "x86_64" ]]; then
  source=("http://mirrors.kernel.org/ubuntu/pool/universe/s/${conflicts}/${pkgname}_${pkgver}-${pkgrel}_amd64.deb")
  sha256sums=('8fc3e7177a85370991f6361e564a93911627c190f90893cff642f01ddd8e0f50')
fi

if [[ "$CARCH" == "i686" ]]; then
  source=("http://mirrors.kernel.org/ubuntu/pool/universe/s/${conflicts}/${pkgname}_${pkgver}-${pkgrel}_i386.deb")
  sha256sums=('310f11b3ed2db28e9adad557dd3e95acecb22ab5fffad5a6a8936f510899e2ca')
fi

build() {
  cd "$srcdir"
  bsdtar xf "$srcdir/data.tar.xz"
}

package() {
  cp -dpr --no-preserve=ownership "$srcdir/usr" "$pkgdir"
}