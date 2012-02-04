# Contributor: Benjamin Hedrich <phpogo@gmx.net> 
# Category: network

pkgname=plone-beta
pkgver=4.0a3
pkgrel=1
pkgdesc="A powerful, flexible Content Management solution that is easy to install, use and extend"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.plone.org/"
depends=('gcc')
conflicts=('plone')
install=plone.install
backup=('opt/Plone/Plone/zinstance/filestorage/Data.fs' 
        'opt/Plone/Plone/zinstance/buildout.cfg')
source=(http://launchpad.net/plone/4.0/$pkgver/+download/Plone-$pkgver-UnifiedInstaller.tgz
        plone.daemon
        plone.install)
md5sums=('a477c9cadb7cf53758234c323f09d06c'
         'dbd30acc21b00e8c3c2b47658735163b'
         '4df127dae1bb4af0c403af72d83659d2')


build() {

    mkdir -p $pkgdir/opt/Plone/
    mkdir -p $pkgdir/etc/rc.d/

    cp $srcdir/Plone-$pkgver-UnifiedInstaller $pkgdir/opt/Plone/ -R
    cp $srcdir/plone.daemon $pkgdir/etc/rc.d/plone
    
}
