# Maintainer:  Max Gonzih <iam at gonzih dot org>

pkgname=clip2net
pkgver=1.0
pkgrel=1
pkgdesc="Clip2Net"
arch=('i686' 'x86_64')
url="http://clip2net.com/"
license=('custom:Clip2Net')
options=("!strip")

source=("http://dl.dropbox.com/u/4109351/soft/clip2net/clip2net-0.1b/clip2net")
md5sums=('d263cdc0bec470e01a6f60068dfcfcc7')


package() {
    mkdir -p $pkgdir/opt/clip2net-0.1b/
    cp $srcdir/clip2net $pkgdir/opt/clip2net-0.1b/clip2net
    chmod 777 $pkgdir/opt/clip2net-0.1b/ -R
}
