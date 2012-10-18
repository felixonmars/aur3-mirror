# Contributor: fuzzix@gmail.com
# Based on beta branch build: http://aur.archlinux.org/packages.php?ID=17178

pkgname=pam_tacplus
pkgver=1.3.7
pkgrel=1
pkgdesc="TACACS+ protocol client library and PAM module"
arch=(i686 x86_64)
url=http://sourceforge.net/projects/tacplus/
license=(GPL)
optdepends=()
source=("http://sourceforge.net/projects/tacplus/files/pam_tacplus-1.3.7.tar.gz")
md5sums=('b7894cca8b1f7f8d87a50d7ba1b28892')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --exec-prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "README" "${pkgdir}/usr/share/doc/${pkgname}/"  || return 1
}


