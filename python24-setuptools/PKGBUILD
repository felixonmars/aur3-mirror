# Maintainer: Tim Hatch <tim@timhatch.com>
# Contributor: Florian Friesdorf <archlinux@chaoflow.net>
# Contributor: simo <simo@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Todd Maynard <arch@toddmaynard.com>

pkgname=python24-setuptools
_pkgname=setuptools
pkgver=0.6c11
pkgrel=1
pkgdesc="A collection of enhancements to the Python distutils"
arch=('i686' 'x86_64')
url="http://peak.telecommunity.com/DevCenter/setuptools"
license=('PSF')
depends=('python24')
conflicts=('setuptools-py24')
replaces=('setuptools-py24')
source=(http://cheeseshop.python.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
md5sums=('7df2a529a074f613b509fb44feefe74e')

build() {
  cd ${startdir}/src/${_pkgname}-${pkgver}
  mkdir -p ${startdir}/pkg/usr/lib/python2.4/site-packages
  python2.4 setup.py install --root=${startdir}/pkg
  echo "/usr/lib/python2.4/site-packages/${_pkgname}-${pkgver}-py2.4.egg" > ${startdir}/pkg/usr/lib/python2.4/site-packages/${_pkgname}.pth

  # we don't provide a non-suffixed easy_install
  echo "Removing non-suffixed easy_install"
  rm ${pkgdir}/usr/bin/easy_install
}

