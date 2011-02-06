# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
# Maintainer: Aurélien DESBRIÈRES <ice.cube@gmx.com>

pkgname=exo-alt
_pkgname=exo
pkgver=0.3.101
pkgrel=2
pkgdesc="Extensions to Xfce by os-cillation with ALT Linux patchset."
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2')
url="http://www.os-cillation.de/index.php?id=29&L=5"
groups=('xfce4')
depends=("libxfce4util>=4.6.0" "hal>=0.5.11-7" 'hicolor-icon-theme')
makedepends=("pygtk>=2.14.0" 'pkgconfig' 'libnotify' 'perl-uri')
optdepends=('libnotify		enables notification support' \
            'perl		enables mail-compose helper script')
provides=("${_pkgname}=${pkgver}")
conflicts=('exo')
options=('!libtool')
install=${pkgname}.install
source=(http://www.xfce.org/archive/xfce-4.6.1/src/${_pkgname}-${pkgver}.tar.bz2
        exo-0.3.2-alt-noatime.patch\
        exo-0.3.4-alt-version-script.patch \
        alt-exo-iocharset.patch\
        exo-0.3.2-alt-eject.patch\
        exo-0.3.2-alt-translation.patch)
md5sums=('1c0eebb360f53eab70454b70e1bde36e'
         '7f34a754b27ade245ce3f6a391c9c40c'
         'b8dd1535fb78fcddbe17a47d77128d38'
         '0f7f8f37d17d10ec9022a8d247b3aa95'
         'f591ab45de3b5afb02936beb9e4b005a'
         '15e40e594d6704c1569aa0d4f264f351')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p2 < "${srcdir}/exo-0.3.2-alt-noatime.patch"  || return 1
  patch -p2 < "${srcdir}/exo-0.3.4-alt-version-script.patch" || return 1
  patch -p1 < "${srcdir}/alt-exo-iocharset.patch"  || return 1
  patch -p2 < "${srcdir}/exo-0.3.2-alt-eject.patch" || return 1
  # Too many hunks failed. Looks like translation already fixed in upstream.
  # patch -p2 < "${srcdir}/exo-0.3.2-alt-translation.patch" || return 1 
  
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static --enable-notifications \
    --enable-python || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install
}
