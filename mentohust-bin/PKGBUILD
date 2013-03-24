# Maintainer: Cravix < dr dot neemous at gmail dot com >
pkgname=mentohust-bin
rln=mentohust
pkgver=0.3.4
pkgrel=3
_pkgrel=2
pkgdesc="mentoHUST with V3 support, directly build from rpm"
arch=('i686' 'x86_64')
url="http://code.google.com/p/mentohust"
license=('GPL')
makedepends=('rpmextract')
depends=('libpcap')
optdepends=('libnotify')
conflicts=('mentohust')
provides=('mentohust')
backup=('etc/mentohust.conf')
source=(http://mentohust.googlecode.com/files/${rln}-${pkgver}-${_pkgrel}.el6.${CARCH}.rpm
        ${rln}
        ${rln}.service)
md5sums=('a22954587a905e629ae832bbfc5c9a7c'
         '748142debf67e5e1cf55a31ccf481b41'
         'bd7b05c0ff9442aa9ee96d29599985fc')
[ "$CARCH" = "x86_64" ] && md5sums[0]='fad553a911cc6831521874b69ecc23c6'

build() {
  cd "${srcdir}"
  rpmextract.sh "${rln}-${pkgver}-${_pkgrel}.el6.${CARCH}.rpm"
}
package() {
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  mkdir -p "$pkgdir/etc/rc.d/"
  cd "$srcdir"
  cp "${rln}" "$pkgdir/etc/rc.d/"
  cp "${rln}.service" "$pkgdir/usr/lib/systemd/system"
  cp -r usr etc "${pkgdir}"
}
