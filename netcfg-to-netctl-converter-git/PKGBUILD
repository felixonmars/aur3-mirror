# Maintainer: Damian Nowak <damian.nowak@atlashost.eu>

pkgname='netcfg-to-netctl-converter-git'
pkgdesc='Convert netcfg to netctl profile'
pkgver='20130922'
pkgrel='1'
arch=('i686' 'x86_64')
url='https://bitbucket.org/Nowaker/netcfg-to-netctl-converter'
license=('BSD')
groups=()
depends=('bash' 'sed' 'grep')
makedepends=('git')
source=('https://bitbucket.org/Nowaker/netcfg-to-netctl-converter/raw/master/netcfg-to-netctl-converter')
noextract=()
md5sums=('SKIP')

build() {
  cd "$srcdir"
}

package() {
  cd "$pkgdir"
  install -D -m0755 "${srcdir}/netcfg-to-netctl-converter" "${pkgdir}/usr/bin/netcfg-to-netctl-converter"
}
