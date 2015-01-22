# Maintainer: Gustavo alvarez <sl1pkn07@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: J. Santiago Hirschfeld <jsantiagoh@yahoo.com.ar>

pkgname=cdfs-dkms
_pkgname=cdfs
pkgver=2.6.27
pkgrel=1
pkgdesc="File system module that 'exports' all tracks and boot images on a CD as normal files."
arch=('i686' 'x86_64')
url="http://www.elis.UGent.be/~ronsse/cdfs/"
license=('GPL')
depends=('dkms')
conflicts=('cdfs')
provides=('cdfs')
install="cdfs.install"
source=('dkms.conf'
        "http://www.elis.UGent.be/~ronsse/cdfs/download/${_pkgname}-${pkgver}.tar.bz2"
        'cdfs-3.0.patch'
        'cdfs-3.2.patch'
        'cdfs-3.4.patch'
        'cdfs-3.8.patch'
		'cdfs-3.18.patch')
md5sums=('5308e109b80a1768fd7eecf981010629'
         'ac64c014a90e3c488394832ea29605b3'
         'aba7da94a9dcbb8a93ea423cb6958fef'
         'e934407b3460257a301822ffc4ab3933'
         '9215e7bdac728bd2f889fb525e543454'
         'b036fd72b033294605bec2b60a73e3bd'
		 'd79354ed391a56dd6847dbb304e1f660')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/cdfs-3.0.patch"
  patch -p1 -i "${srcdir}/cdfs-3.2.patch"
  patch -p1 -i "${srcdir}/cdfs-3.4.patch"
  patch -p1 -i "${srcdir}/cdfs-3.8.patch"
  patch -p1 -i "${srcdir}/cdfs-3.18.patch"
  sed 's|-rm|-rm -fr|' -i Makefile
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm 644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/cdfs-${pkgver}/dkms.conf"
  install -m 644 * "${pkgdir}/usr/src/cdfs-${pkgver}"/
  sed -i "s|@VERSION@|${pkgver}|g" "${pkgdir}/usr/src/cdfs-${pkgver}/dkms.conf"
}
