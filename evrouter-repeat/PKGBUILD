# Contributor: Jonathan Liu <net147@gmail.com>
# Maintainer: Tom Vincent <http://tlvince.com/contact/>
pkgname=evrouter-repeat
_pkgname=evrouter
pkgver=0.4
pkgrel=2
pkgdesc="An Input Event Router for Linux with key repeats patch"
arch=('i686' 'x86_64')
url="http://www.bedroomlan.org/~alexios/coding_evrouter.html"
license=('GPL2')
depends=('libxtst')
makedepends=('automake>=1.10.1')
conflicts=('evrouter')
source=(http://debian.bedroomlan.org/debian/pool/main/e/${_pkgname}/${_pkgname}_${pkgver}.tar.gz
        https://raw.github.com/gist/754395/872183805da1da0b1d7703b0995dc755f8b815ad/evrouter-0.4_with_key_repeats_option.patch)
md5sums=('eef1b9d8e3b545c330eb025670ffa3e8'
         '4f941dfcecff7c9524e4b88968ab36b6')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Repeats patch 
  cd src
  patch -p2 < ${srcdir}/evrouter-0.4_with_key_repeats_option.patch
  cd ..

  aclocal
  automake --add-missing
  ./configure --prefix=/usr --without-xmms
  make || return 1
  make DESTDIR="${pkgdir}" install
  install -D -m644 README "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -D -m644 debian/changelog "${pkgdir}/usr/share/doc/${_pkgname}/changelog"
  install -D -m644 debian/copyright "${pkgdir}/usr/share/doc/${_pkgname}/copyright"
  install -D -m755 src/example "${pkgdir}/usr/share/doc/${_pkgname}/examples/example"
}

# vim:set ts=2 sw=2 et:
