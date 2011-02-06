# Contributor: twa022 <twa022 at gmail dot com>

pkgname=netbook-launcher-efl
pkgver=0.3.2
pkgrel=1
pkgdesc="UNR legeraging the EFL for lower graphics power systems."
arch=('i686' 'x86_64')
url="https://code.launchpad.net/launch-lite-proj/+download"
license=('GPL3')
depends=('liblauncher>=0.3' 'libunique' 'elementary-svn' 'libnotify>=0.3.2' 'libcanberra' 'libwnck')
conflicts=('netbook-launcher-efl-bzr')
source=(http://code.launchpad.net/launch-lite-proj/${pkgver%.*}/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz
        label-full-clipper-no-color3.patch)
	
build() {
  cd ${srcdir}
  patch -Np1 -i ${srcdir}/label-full-clipper-no-color3.patch
  cd ${srcdir}/${pkgname}-${pkgver}
  sed -i 's:eina-0:eina:g' configure
  ./configure --prefix=/usr --sysconfdir=/etc
  make all || return 1
  make DESTDIR=${pkgdir} install
  
}

md5sums=('8b369912cb8d29a2ceaeeb0082467d86'
         'b5bf820fdac505547feefbb061797a52')
