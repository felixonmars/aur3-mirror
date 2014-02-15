# Maintainer : n00b <dannyurvt (at) gmail.com>

pkgname=mate-file-archiver-thunar
pkgver=1.6.2
pkgrel=1
pkgdesc="Archive manipulator for MATE without caja dependency and with thunar-archive-plugin support, not meant to be used with caja"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dconf' 'bzip2' 'desktop-file-utils' 'gtk2' 'gzip' 'libarchive' 'tar')
makedepends=('mate-common' 'mate-doc-utils' 'perl-xml-parser')
optdepends=('arj: for ARJ support'
            'p7zip: for 7zip support'
            'unrar: for RAR extract support'
            'unace: for ACE extract support'
            'unzip: for ZIP extract support'
            'zip: for ZIP support'
	    'thunar-archive-plugin: create and deflate archives in thunar')
conflicts=('mate-file-archiver')
options=('!emptydirs')
source=("http://pub.mate-desktop.org/releases/1.6/${pkgname%-*}-${pkgver}.tar.xz"
        fr-rpm-bsdtar.patch
	caja_schema_fix.patch
	engrampa.tap)
sha1sums=('58a0f7d78dabd627a3a2b3352fabcba20d72aa92'
          '219b05a979bf6f249aaae27964f02345fd81168d'
	  'aa4ed66f955dbe5a5cc63f810e9f511a42a64d62'
	  'd493b15ccf77279dfa9dbe2c05243acf26be004a')

install=${pkgname%-*}.install

prepare() {
    cd "${srcdir}/${pkgname%-*}-${pkgver}"    
    # This patch 'depends' on libarchive
    patch -Np1 -i "${srcdir}/fr-rpm-bsdtar.patch"
    # Make caja depencenies optional
    patch -Np1 -i "${srcdir}/caja_schema_fix.patch"	
}

build() {
    cd "${srcdir}/${pkgname%-*}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${pkgname%-*} \
        --disable-static \
        --disable-scrollkeeper \
        --disable-packagekit \
	--disable-caja-actions
    mate-doc-prepare --force
    make
}

package() {
    cd "${srcdir}/${pkgname%-*}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -Dm755 ${srcdir}/engrampa.tap ${pkgdir}/usr/lib/xfce4/thunar-archive-plugin/engrampa.tap
}
