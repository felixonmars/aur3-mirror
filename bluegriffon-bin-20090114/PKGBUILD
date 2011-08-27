# Contributor: Terry Mitchell <tcmdvm@charter.net>

pkgname=bluegriffon-bin-20090114
pkgver=0.1
pkgrel=1
pkgdesc="The next-generation Web Editor based on the rendering engine of Firefox."
arch=(i686 x86_64)
license=('GPL')
url="http://www.bluegriffon.org"
depends=('gtk2' 'glib2' 'pango' 'nss' 'libxt' 'libidl2')
makedepends=('zip' 'pkgconfig')
install=(bluegriffon.install)
source=(http://www.bluegriffon.org/freshmeat/nightlies/20090114/bluegriffon-20090114.en-US.ubuntu-8.04-i686.tar.bz2 bluegriffon.desktop bluegriffon.install)
md5sums=('93611fe080d6a9cca5ca533b193ff6fe'
         '50eb358423ad7b2961bcee7b6de75d75'
         '12358136cbaf6d147ea33097372848b8')

build() {
    cd $srcdir

    
  # Create directory and copy everything
    install -d $pkgdir/opt/bluegriffon
    cp -a $srcdir/bluegriffon/* $pkgdir/opt/bluegriffon || return 1

# Fix permissions
    find $pkgdir/opt/bluegriffon -type d -exec chmod 755 {} +
    find $pkgdir/opt/bluegriffon -type f -exec chmod 644 {} +
    chmod 755 $pkgdir/opt/bluegriffon/bluegriffon{,-bin}
    chmod 755 $pkgdir/opt/bluegriffon/run-mozilla.sh

  # Install bin, icon and desktop
  install -Dm 755 $srcdir/bluegriffon-launcher.sh $pkgdir/usr/bin/bluegriffon
    install -Dm 644 $srcdir/bluegriffon/icons/bluegriffon50.xpm \
        $pkgdir/usr/share/pixmaps/bluegriffon.xpm
    install -Dm 644 $srcdir/bluegriffon.desktop \
        $pkgdir/usr/share/applications/bluegriffon.desktop


}
