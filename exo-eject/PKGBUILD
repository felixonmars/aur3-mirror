# Contributor: Shae Smittle <starfall87@gmail.com>
# Maintainer: Aurélien DESBRIÈRES <ice.cube@gmx.com>

pkgname=exo-eject
_pkgname=exo
pkgver=0.3.101
pkgrel=3
pkgdesc="Extensions to Xfce by os-cillation with hal ejection patch"
arch=('i686' 'x86_64')
url="http://www.os-cillation.de/index.php?id=29&L=5"
license=('GPL2' 'LGPL2')
groups=('xfce4')
depends=("libxfce4util>=4.6.0" "hal>=0.5.11-7" 'hicolor-icon-theme' 'intltool')
makedepends=("pygtk>=2.14.0" 'pkgconfig' 'libnotify' 'perl-uri')
optdepends=('libnotify		enables notification support' \
            'perl		enables mail-compose helper script')
options=('!libtool')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
install=${pkgname}.install
source=(http://www.xfce.org/archive/xfce-4.6.1/src/$_pkgname-$pkgver.tar.bz2 eject.patch)
md5sums=('1c0eebb360f53eab70454b70e1bde36e'
         '8c19efbf5f6f97c2d040817cad08fd2d')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -Np1 -i ../eject.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static --enable-notifications \
    --enable-python || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install
}

