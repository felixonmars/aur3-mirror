# $Id:$
# Maintainer: Balwinder S "bdheeman" Dheeman (bdheeman AT gmail.com)
# Maintainer: Kurt J. Bosch <kujub at quantentunnel dot de>

pkgname="fbsplash-uswsusp"
pkgver=0.8
pkgrel=1
pkgdesc="Allows suspend/resume with new userspace and fbsplash"
arch=(i686 x86_64)
url='http://suspend.sourceforge.net/'
license=(GPL)
depends=(lzo2 libx86 libgcrypt fbsplash) 
makedepends=(libgcrypt gcc make)
conflicts=(suspend uswsusp uswsusp-fbsplash)
replaces=(suspend uswsusp uswsusp-fbsplash)
provides=(uswsusp)
backup=(etc/suspend.conf)
install=uswsusp.install
source=("http://downloads.sourceforge.net/suspend/suspend-${pkgver}.tar.gz"
        uresume-hook uresume-install fbsplash-type-fix.patch fbsplash-effects-fix.patch)

build() {
    cd $startdir/src/suspend-$pkgver

    # Fix the splash type: Use 'suspend' and 'resume' instead of 'bootup'
    patch -Np1 -i ../fbsplash-type-fix.patch || return 1

    # Make fade effects depend on kernel cmdline
    # Fix missing fadeout on suspend
    # Fix progress after resume
    patch -Np2 -i ../fbsplash-effects-fix.patch || return 1

    ./configure --enable-compress --enable-encrypt \
	--disable-resume-static --disable-static \
	--enable-fbsplash \
	--prefix=/usr --sysconfdir=/etc
    make DESTDIR=$pkgdir install || return 1

    install -D -m 644 ../uresume-hook $startdir/pkg/lib/initcpio/hooks/uresume && \
    install -D -m 644 ../uresume-install $startdir/pkg/lib/initcpio/install/uresume
}

# vim:set ts=4 sw=4 et:
md5sums=('c81817b2ba2be899cdb32c00de016bff'
         '245e20f8c5e33f6db756331083e4aea6'
         '4cefb2ede6bd2c7e349b25b1b50b76ca'
         'ba73824e616ccf50f5e8ebd95be007a0'
         'e6cf49281a0fe149ba17f1e2b19a2787')
