# Maintainer: Hüseyin Gökhan Sarı <th0th@returnfalse.net>
# Contributor: evnu <mamuelle@informatik.hu-berlin.de>
pkgname=radicale-git
pkgver=0.r569.a957ebf
pkgrel=1
pkgdesc="A Simple Calendar Server"
arch=(any)
url="http://radicale.org"
license=('GPL3')
depends=('python')
makedepends=('git')
conflicts=('radicale')
backup=('etc/radicale/config')
provides=('radicale')
source=('radicale.service'
        'radicale.install'
        "${pkgname}"::'git://github.com/Kozea/Radicale.git')
install='radicale.install'
md5sums=('6fe1c498e34b155e1d31accb3e07e8e1'
         '735df227833335f61251999878b01763'
         'SKIP')
pkgver() {
  cd "$srcdir/${pkgname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname}"
  python setup.py install --root=${pkgdir} --optimize=1
  install -D "$srcdir/${pkgname}/config" "$pkgdir/etc/radicale/config"
  install -d -m755 "${pkgdir}/usr/lib/systemd/system/"
  install -m744 -D "${srcdir}/radicale.service" "${pkgdir}/usr/lib/systemd/system/"
 } 

 # vim:set ts=2 sw=2 et:
