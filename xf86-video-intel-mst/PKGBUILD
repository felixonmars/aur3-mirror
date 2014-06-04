# Maintainer: Julius Haertl <jus@jus.li>

pkgname=xf86-video-intel-mst
pkgver=2.99.911
pkgrel=1
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
pkgdesc="X.org Intel i810/i830/i915/945G/G965+ video drivers patched with mst support"
depends=('intel-dri' 'libxvmc' 'xcb-util>=0.3.9' 'systemd')
makedepends=('git' 'xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=15' 'resourceproto' 'scrnsaverproto' 'libx11' 'libxrender')
replaces=('xf86-video-intel-uxa' 'xf86-video-intel-sna' 'xf86-video-intel')
provides=('xf86-video-intel-uxa' 'xf86-video-intel-sna' 'xf86-video-intel')
conflicts=('xorg-server<1.14.0' 'xf86-video-intel-sna' 'xf86-video-intel-uxa' 'xf86-video-i810' 'xf86-video-intel-legacy' 'xf86-video-intel')
options=('!libtool')
groups=('xorg-drivers' 'xorg')
source=('20-intel.conf')
sha1sums=('SKIP')
_gitroot='http://git.bitgrid.net/cgit/xf86-video-intel'
_gitname='xf86-video-intel'

build() {

    cd ${srcdir}/

    msg "Connecting to the GIT server...."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
        cd ${srcdir}/${_gitname}
        git pull origin
        msg "The local files are updated..."
    else
        git clone ${_gitroot}
        cd ${_gitname}
    fi
    git checkout uxa-mst-support-rebase

    msg "GIT checkout done."

    msg "Starting make for: ${pkgname}"

    if [[ -d ${srcdir}/${_gitname}-build ]]; then
        msg "Cleaning the previous build directory..." 
        rm -rf ${srcdir}/${_gitname}-build
    fi

    git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build

    cd ${srcdir}/${_gitname}-build

    msg "Starting configure..."

    ./autogen.sh --prefix=/usr \
        --enable-dri 

    make
}

package() {
    cd "${srcdir}/${_gitname}-build"
    make DESTDIR="${pkgdir}" install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    cd "${srcdir}"
    install -D -m644 20-intel.conf "${pkgdir}/etc/X11/xorg.conf.d/20-intel.conf"
}

