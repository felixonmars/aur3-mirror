# Maintainer:  perlawk

pkgname=euphoria64
_pkgname=euphoria
pkgver=4.1.0
pkgrel=1
pkgdesc="Euphoria is a powerful but easy-to-learn programming language. It has a simple syntax and structure with consistent rules, and is also easy to read. 64bits only"
url="http://openeuphoria.org"
license=('custom:"OpenEuphoria License"')
conflicts=('euphoria')
arch=('x86_64')
source=(http://openeuphoria.org/eubins/linux/4.1.0/64-bit/euphoria-4.1.0-Linux-ix86_64-2012-11-12-c4cf83a3db32.tar.gz)
install=install.txt

build() {
  cd ${srcdir}/${_pkgname}-$pkgver*/
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}*

  mkdir -p "${pkgdir}/usr/share/${_pkgname}/"
	cp -a include bin "${pkgdir}/usr/share/${_pkgname}/"

  # Make an initial eu.cfg
  cat > eu.cfg <<EOF
[all]
-i /usr/share/${_pkgname}/include
EOF
  mkdir -p "${pkgdir}/etc/${_pkgname}"
  install -m644 eu.cfg "${pkgdir}/etc/${_pkgname}"
}

md5sums=('cfb9cba4925ec1c07aadf12fba6aad6f')
