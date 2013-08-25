# Contributor: hauzer <alokinpwn@gmail.com>

pkgname=pfilesearch
pkgver=1.34
pkgrel=1
pkgdesc="Lets you search for files with advanced options."
arch=('any')
url="http://www.murga-linux.com/puppy/viewtopic.php?p=177950"
license=('unknown')
depends=('gtkdialog')
makedepends=('pet2tgz')
source=("${pkgname}-${pkgver}.pet")
md5sums=('e9a82573bfd6f993d039793d65d058de')


prepare() {
  cat > ${pkgname} <<EOF
#!/bin/bash
"/usr/share/${pkgname}/${pkgname}" "\$@"
EOF
}

build() {
  pet2tgz -i "${srcdir}/${pkgname}-${pkgver}.pet" -o "${srcdir}/${pkgname}-${pkgver}.tar.gz"
  tar -xzf "${srcdir}/${pkgname}-${pkgver}.tar.gz"
}

package() {
  install -D -m755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  mkdir -p "${pkgdir}/usr/share"
  cp -r "${srcdir}/${pkgname}-${pkgver}/usr/local/${pkgname}" "${pkgdir}/usr/share/"
}
