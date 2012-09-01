# Maintainer: <predrg@gmail.com>

pkgname=blueproxy-svc-uuid
origpkgname=blueproxy
pkgver=1.3
pkgrel=1
pkgdesc="Blueproxy patched to support specification of service uuid."
url="http://anil.recoil.org/projects/blueproxy.html"
arch=('x86_64' 'i686')
license=('MIT')
depends=('bluez')
optdepends=()
makedepends=()
conflicts=(blueproxy)
replaces=()
backup=()
install=''
source=("http://anil.recoil.org/projects/${origpkgname}-${pkgver}.tar.gz"
        blueproxy-service-uuid-from-cmdline-and-max-channels-limit.patch)
md5sums=('bac65859ddc54efb11767ea835d9c40d'
         '2544a1f26f12d11d9c205872ae392a3b')

build() {
  cd "${srcdir}/${origpkgname}-${pkgver}"
  patch -p1 < ../blueproxy-service-uuid-from-cmdline-and-max-channels-limit.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${origpkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/"{bin,man/man1}
  make prefix="${pkgdir}/usr" install
  for f in AUTHORS README; do
      install -Dm644 $f "$pkgdir/usr/share/doc/$origpkgname/$f"
  done
}
