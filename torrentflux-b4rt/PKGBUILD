# Contributor: John Pittman fiatguy85 <at> gmail <dot> com
pkgname=torrentflux-b4rt
pkgver=1.0.2
_pkgver=1.0-beta2
pkgrel=2
pkgdesc="Torrentflux-b4rt is a web based transfer control client."
arch=('any')
url="http://tf-b4rt.berlios.de/"
license=('GPL')
groups=()
depends=('apache' 'php' 'php-apache' 'mysql'  'php-gd' 'perl-xml-simple' 'perl-xml-dom' 'perl-digest-sha1')
makedepends=()
optdepends=()
provides=('torrentflux-b4rt')
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://download.berlios.de/tf-b4rt/${pkgname}_${_pkgver}.tar.bz2")
noextract=()
md5sums=('c7d755d88f79927eb446978f534fece0')

build() {
        cd $srcdir/${pkgname}_${_pkgver}
        install -d $pkgdir/opt/torrentflux-b4rt
        cp -R * $pkgdir/opt/torrentflux-b4rt

        cd $pkgdir
        chgrp -R daemon opt/torrentflux-b4rt
        chmod -R 755 opt/torrentflux-b4rt
}

