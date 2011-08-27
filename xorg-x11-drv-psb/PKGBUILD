# Contributor: Chris Griffith <codelicious.griffith at gmail dot com>
# Maintainer: Sergey Tereschenko <serg.partizan at gmail dot com>
pkgname=xorg-x11-drv-psb
_src_pkg=xserver-xorg-video-psb
pkgver=0.36.0
_uver=0ubuntu3~1010um7
_fullpkgname=${_src_pkg}_${pkgver}
_pkgdirname=${_src_pkg}-${pkgver}
pkgrel=2
pkgdesc="Xorg driver for the Intel Poulsbo (aka GMA500) graphic chipset"
arch=('i686')
url="https://launchpad.net/~gma500/"
license=('MIT')
groups=()
depends=('glibc' 'xpsb-glx>=0.18' 'xorg-server>=1.9.0' 'psb-kmod>=4.41.1' 'psb-firmware>=0.30' 'libdrm-poulsbo>=2.3.0' 'mesa')
makedepends=('xf86driproto>=2.1.0' 'glproto>=1.4.10' 'xorg-util-macros>=1.3.0' 'xf86dgaproto' 'xineramaproto' 'xorg-server-devel')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
changelog=ChangeLog
options=('!libtool')
install=
source=("http://ppa.launchpad.net/gma500/ppa/ubuntu/pool/main/x/${_src_pkg}/${_fullpkgname}-${_uver}.tar.gz" "poulsbo-modprobe.conf") 
noextract=()
	
build() {
    #cd here just in case we are not already in src.
    cd ${srcdir}/${_src_pkg};

    #apply patches
    for i in `grep -v "^#" debian/patches/series`;
    do
        patch -Np1 -i debian/patches/$i || return 1;
    done

    #change characterset of man page to utf-8
    iconv -f iso-8859-15 -t utf-8 -o man/psb.man.utf8 man/psb.man && mv man/psb.man.utf8 man/psb.man

    #compile
    autoreconf -i;

    CFLAGS="-fvisibility=default" ./configure --prefix=/usr --disable-static;
    make || return 1;
}
package () {
    cd ${srcdir}/${_src_pkg};

    #install
    make DESTDIR=${pkgdir}/ install;

    #copy the modprobe config
    install -dm 755 ${pkgdir}/etc/modprobe.d/
    install -m 644 ${srcdir}/poulsbo-modprobe.conf ${pkgdir}/etc/modprobe.d/poulsbo.conf

    #copy MIT license over
    install -dm 755 ${pkgdir}/usr/share/licenses/${pkgname}
    install -m 644 MIT_License.txt ${pkgdir}/usr/share/licenses/${pkgname}
}

md5sums=('c41f9362667cb1330852fd87d831f90c'
         '4413ae7d54a457c207ff1cbba209480d')
