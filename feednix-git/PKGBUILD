# Maintainer: Jorge Martinez Hernandez <jorgemartinezhernandez@gmail.com>
# Contributor: Jorge Martinez Hernandez <jorgemartinezhernandez@gmail.com>

pkgname=feednix-git
pkgver=v0.6.5.1.rfe516a6
pkgrel=1
pkgdesc="A simple ncurses-based console client for Feedly"

arch=('i686' 'x86_64')
url="http://feednix-jarkore.rhcloud.com/"
license=('GPL3')
depends=('ncurses' 'curl' 'jsoncpp' 'w3m')
makedepends=('git')
md5sums=('SKIP')

source=('Feednix::git+http://github.com/Jarkore/Feednix')

pkgver() {
        cd "$srcdir/Feednix"
        git describe --long | sed -r 's/([^-]*g)/r\l/;s/-/./g'
}

build(){
        cd Feednix
        ./autogen.sh
        ./configure
        make
}

package(){
        cd "${srcdir}/Feednix"
        make PREFIX=/usr DESTDIR="${pkgdir}" install
        install -D -m755 config.json "${pkgdir}/etc/feednix/config.json"
        install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/feednix/LICENSE"
}
