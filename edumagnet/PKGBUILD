# Maintainer: archtux <antonio.arias99999@gmail.com>
# Contributor: MWG-Release-Team <release@tvmagnet.org>

pkgname=edumagnet
pkgver=0.11
pkgrel=1
pkgdesc="Video player for searching and downloading educational videos from youtube, vimeo, public tv sites, RSS feeds, ..."
arch=('i686' 'x86_64')
url="https://www.edumagnet.org/"
license=('GPL')
depends=('gtk2' 'libgcrypt' 'python-m2crypto')

if [ "${CARCH}" = 'x86_64' ]; then
  source=(http://prdownload.berlios.de/$pkgname/${pkgname}_ubuntu-9.10_0.11.1-1_amd64.deb)
  md5sums=('b80a3562f41751eae4ebaa8d2a0b11a3')
elif  [ "${CARCH}" = 'i686' ]; then 
  source=(http://download.berlios.de/$pkgname/${pkgname}_ubuntu-9.10_0.11.1-1_i386.deb)
  md5sums=('e57b5b71245270651a3acb5a0891c0ca')
fi

build() {
    cd $srcdir

if [ "${CARCH}" = 'x86_64' ]; then
    bsdtar xf ${pkgname}_ubuntu-9.10_0.11.1-1_amd64.deb
elif  [ "${CARCH}" = 'i686' ]; then 
    bsdtar xf ${pkgname}_ubuntu-9.10_0.11.1-1_i386.deb
fi

    bsdtar xf data.tar.gz -C $pkgdir
    mv $pkgdir/usr/lib/python2.6/dist-packages $pkgdir/usr/lib/python2.6/site-packages
}