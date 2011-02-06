# $Id: PKGBUILD 28045 2009-02-27 20:06:21Z andyrtr $
# Maintainer:
# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>

pkgname=exo-mountopt
_pkgname=exo
pkgver=0.3.101
pkgrel=2
pkgdesc="Extensions to Xfce by os-cillation (+ mount options patch)"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2')
url="http://www.os-cillation.com/article.php?sid=40"
groups=('xfce4')
depends=("libxfce4util>=4.6.1" "hal>=0.5.12git20090406" 'hicolor-icon-theme')
makedepends=("pygtk>=2.14.1" 'pkgconfig' 'libnotify' 'perl-uri')
optdepends=('libnotify		enables notification support' \
            'perl		enables mail-compose helper script')
options=('!libtool')
install=${pkgname}.install
conflicts=(exo)
provides=(exo=0.3.101)
source=(http://www.xfce.org/archive/xfce-4.6.1/src/${_pkgname}-${pkgver}.tar.bz2 exo-hal-mount-options.patch exo-0.3.2-alt-eject.patch mount.rules)

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  
  patch -p1 < ../exo-hal-mount-options.patch
  patch -p2 < ../exo-0.3.2-alt-eject.patch
  
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static --enable-notifications \
    --enable-python || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  
  cp ../mount.rules ${pkgdir}/usr/share/xfce4/
}

md5sums=('1c0eebb360f53eab70454b70e1bde36e'
         '3adfa67ceeaffc973b5a6f28aa85bc7d'
	 'f591ab45de3b5afb02936beb9e4b005a'
	 '7256efddcc2caca2d57d43394fb32f63')

