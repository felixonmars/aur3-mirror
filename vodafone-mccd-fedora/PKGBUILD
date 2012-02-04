# Contributor: LUO, Jian <jian (dot) luo (dot) cn (at) gmail (dot) com>

pkgname=vodafone-mccd-fedora
pkgver=1.99.17_8
pkgrel=1
pkgdesc="Vodafone Mobile Connect Card Driver, a GPRS/UMTS/HSDPA(3G) device manager"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2' 'BSD' 'MIT')
url="https://forge.vodafonebetavine.net/projects/vodafonemobilec/"
depends=('dbus-python' 'twisted' 'python-pyserial' 'wvdial' 'python-notify' 'gnome-python-extras' 'hal' 'python-pytz' 'pygtk' 'pyxml' 'lsb-release')
makedepends=('rpmextract')
install=vodafone-mccd-fedora.install
source=(https://forge.betavine.net/frs/download.php/441/vodafone-mobile-connect-$pkgver.noarch.rpm
        gentoo-arch.patch)
md5sums=('d991b721d11afdf0b0fff03aa3fc2a6c'
         'f0312a28549b54d17e80e4fc283997c4')

build() {
  mkdir -p $startdir/src/$pkgname-$pkgver
  cd $startdir/src/$pkgname-$pkgver
  rpmextract.sh $startdir/src/vodafone-mobile-connect-$pkgver.noarch.rpm
  patch -Np0 -i $startdir/src/gentoo-arch.patch || return 1
  cp -av $startdir/src/$pkgname-$pkgver/* $startdir/pkg
  chmod a+x $startdir/pkg/usr/bin/vmc-cli-client.py
  mv $startdir/pkg/usr/lib/python2.5 $startdir/pkg/usr/lib/python2.6
  cd $startdir/pkg/usr/lib/python2.6/site-packages
  mv vodafone_mobile_connect-1.99.17-py2.5.egg-info vodafone_mobile_connect-1.99.17-py2.6.egg-info
}
# vim: sts=2 sw=2
