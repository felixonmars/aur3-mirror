# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: cwchen <linuxisfun0104@gmail.com>
# Contributor: Florian Friesdorf <archlinux@chaoflow.net>
# Contributor: simo <simo@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Todd Maynard <arch@toddmaynard.com>

pkgname=python2-setuptools
_pkgname=setuptools
pkgver=0.6c11
pkgrel=2
pkgdesc="A collection of enhancements to the Python distutils"
arch=('any')
url="http://peak.telecommunity.com/DevCenter/setuptools"
license=('PSF')
depends=('python2')
provides=('setuptools')
conflicts=('python2-distribute')
source=(http://pypi.python.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
md5sums=('7df2a529a074f613b509fb44feefe74e')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  python2 setup.py install --root=${pkgdir} --prefix=/usr

# we don't provide a non-suffixed easy_install
  echo "Removing non-suffixed easy_install"
  rm ${pkgdir}/usr/bin/easy_install
}
