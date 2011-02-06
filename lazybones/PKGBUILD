# Contributor: Mattheus Happe <mhappe@gmail.com>
 
pkgname=lazybones
_rpkgname=LazyBones
pkgver=cvs_20080425
_rpkgver=cvs-2008-04-25
pkgrel=1
pkgdesc="Lazy Bones is a plugin for the great EPG-software TV-Browser. With Lazy Bones you can control a VDR. Lazy Bones supports the programming and editing of recording timers and comes with a remote control."
url="http://hampelratte.org/blog/?page_id=6"
depends=('jre' 'tvbrowser')
source=(http://download2.berlios.de/$pkgname/$_rpkgname-$_rpkgver.zip)
md5sums=('de00ffa4cfee7e4d48d33b9dead9b187')
arch=('i686' 'x86_64')
license="GPL"

build() {
     mkdir -p $startdir/pkg/opt/tvbrowser/plugins
     install -D -m755 $startdir/src/LazyBones.jar $startdir/pkg/opt/tvbrowser/plugins/
}

