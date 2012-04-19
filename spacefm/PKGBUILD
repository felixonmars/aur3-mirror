# Maintainer: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/
# Thanks to ridikulus_rat for PKGBUILD improvements
pkgname="spacefm"
pkgver=0.7.6
pkgrel=1
pkgdesc="A multi-panel tabbed file manager"
arch=('i686' 'x86_64')
url=("http://ignorantguru.github.com/spacefm/")
license=('GPL2')

makedepends=('intltool' 'gettext')
depends=('gtk2' 'shared-mime-info' 'desktop-file-utils' 'startup-notification' 'udev')
optdepends=('lsof: device processes'
            'eject: eject media'
            'wget: plugin download'
            'ktsuss: perform as root functionality'
            'gksu: perform as root functionality'
            'pmount: mount as non-root user'
            'udisks: mount as non-root user'
            'udisks2: mount as non-root user')
conflicts=('spacefm-git')
install="spacefm.install"
source=("https://raw.github.com/IgnorantGuru/spacefm/master/packages/${pkgver}/spacefm-${pkgver}.tar.xz")
md5sums=('572b256ab46073d8bb065999bd531423')
sha256sums=('8ea46bd9fcf93e391cee57749915ff8b773cb959ad18ace0987a97ba8b3e3519')

# Set USE_GDB=1 to build for gdb debugging, otherwise set USE_GDB=0
USE_GDB=0

if (( USE_GDB == 1 )); then
    options=('!strip')
fi

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    echo
    
    # NOTE: To enable hal support add --enable-hal to
    # configure line below. See README for details.
    # NOTE: To disable inotify and use fam or gamin instead, add:
    # --disable-inotify to configure line below.
    # NOTE: To add a custom su program (mysu in this example), add:
    # --with-preferable-sudo="mysu"  to configure line below.
    
    if (( USE_GDB == 1 )); then
        CFLAGS+="-g" ./configure --prefix=/usr
        echo
        CFLAGS+="-g" make
    else
        ./configure --prefix=/usr
        echo
        make
    fi
    echo
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    echo
    make DESTDIR="${pkgdir}/" install
    echo
}

