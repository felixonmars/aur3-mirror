#Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname=nyan-git
pkgver=10.199f680
pkgrel=1
pkgdesc="a simple netcrat wrapper"
provides='nyan'
conflicts='nyan'
arch=("any")
url=("https://github.com/shibumi/nyan")
license=("GPLv3")
depends=("gnu-netcat" "pv")
makedepends=("git")
source=("git+http://github.com/shibumi/nyan")
md5sums=("SKIP")

pkgver() {
  cd nyan
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {

  install -D -m755 "${srcdir}/nyan/nyan.sh" \
    "${pkgdir}/usr/bin/nyan"

}
