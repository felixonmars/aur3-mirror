# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=massmol
pkgver=1.5.2
pkgrel=1
pkgdesc="A program that displays information about a given molecule"
arch=('i686' 'x86_64')
url="http://sophie.zarb.org/rpms/b89d2834906b6ed408df52d93250f63d"
license=('GPL3')
depends=('wxgtk')
source=("http://distro.ibiblio.org/pub/linux/distributions/mageia/distrib/cauldron/SRPMS/core/release/${pkgname}-${pkgver}-2.mga2.src.rpm"
        "desktop-file.patch")
md5sums=('110fe0aea5d29cb4a4e1d683426b7ce7'
         '0c18a0eef6b9d3637bad3f5be4b3255f')

build() {
  cd "${srcdir}"

  # Extract sources
  bsdtar -xf ${pkgname}-${pkgver}.tar.gz
  cd ${pkgname}-${pkgver}

  # Fix desktop entry warnings
  patch -Np1 -i ../desktop-file.patch

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
