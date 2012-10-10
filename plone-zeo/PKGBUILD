# Maintainer: Chris Wagner <wagnerlia-arch at yahoo dot com>
# Adapted from: Timo Lindemann <coffeeprocessor@gmail.com> (plone4)
# Category: network
# 
# For a production root zeoserver install in /opt using the the Plone Unified Installer
# http://plone.org/documentation/manual/installing-plone/installing-on-linux-unix-bsd
# see: dependencies and install options described in the above link

pkgname=plone-zeo
pkgver=4.2.1
pkgrel=1
pkgdesc="A powerful Content Management System in ZEO Client/Server configuration"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.plone.org/"

depends=('libxml2' 'libxslt' 'libjpeg-turbo' 'openssl' 'sudo')
optdepends=('wv: Word document indexing' 'poppler: PDF document indexing')
conflicts=('plone' 'plone4' 'plone-beta')
provides=('plone')

install=plone.install

source=(http://launchpad.net/plone/${pkgver:0:3}/${pkgver}/+download/Plone-${pkgver}-UnifiedInstaller.tgz
        plone.d
        plone.service
        plone.install
        ChangeLog)
				  
md5sums=('c5867e7901daac492fad9207e7ac91b6'
         'b2036b7753515f45abe08c8941498319'
         'b1c357de488e21e9ee0109f0f4b6bfd2'
         '524cf3da8b0c1f47cf7f28f0b6d6a79a'
         '9353aead4223fb4f53123b5b5d8959d6')
         
package() {
    # only the Plone Unified Installer and the service files get installed by Pacman
    mkdir -p ${pkgdir}/usr/src/plone/
    cp -R ${srcdir}/Plone-${pkgver}-UnifiedInstaller $pkgdir/usr/src/plone/
    
    install -Dm755 ${srcdir}/plone.d ${pkgdir}/etc/rc.d/plone
    install -Dm644 ${srcdir}/plone.service "${pkgdir}"/usr/lib/systemd/system/plone.service
}

# vim:set ts=2 sw=2 et: