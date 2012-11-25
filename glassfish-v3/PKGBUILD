# Maintainer: Valentin-Costel Hăloiu <vially.ichb@gmail.com>
# Contributor: Bernhard Friedreich <friesoft@gmail.com> (maintainer)
# Contributor: aleph (rc script)
# Contributor: coverslide (new version)
# Contributor: andrej (new pkgbuild)
# Contributor: xtecuan (config)
# Contributor: Thief_hu (rc script fix)
# Contributor: Simon Tunnat (systemd service file)

pkgname=glassfish-v3
pkgver=3.1.2.2
pkgrel=2
pkgdesc="GlassFish is a Java EE open source application server"
url="http://glassfish.java.net/"
license=(GPL CDDL)
provides=(glassfish)
conflicts=(glassfish)
depends=(java-runtime apache-ant)
makedepends=(java-environment)
arch=(i686 x86_64)
options=(!strip)
source=(http://download.java.net/glassfish/${pkgver}/release/glassfish-${pkgver}.zip
       glassfish
       glassfishrc
       glassfish.service
)

md5sums=('ae8e17e9dcc80117cb4b39284302763f'
         '83c7404a5aa75dd970ea7ff3fdfef445'
         'f5a5a1fec2d448afad28b017a8268a6b'
         '0a033c6c93255981cbdec131ed28cc81')

package() {
    mkdir -p $pkgdir/opt
    mv glassfish3 $pkgdir/opt/
    install -D $srcdir/glassfish $pkgdir/etc/conf.d/glassfish
    install -D $srcdir/glassfishrc $pkgdir/etc/rc.d/glassfish
    install -D $srcdir/glassfish.service $pkgdir/usr/lib/systemd/system/glassfish.service
}
