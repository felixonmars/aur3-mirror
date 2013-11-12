# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: kingcody <me@codymize.com>
pkgname=shairport-git-sysdcompat
pkgver=20131111
pkgrel=1
pkgdesc="an AirTunes/raop server with systemd service script"
url='http://github.com/abrasive/shairport'
arch=('i686' 'x86_64' 'armv6h')
license=("custom:Shairport")
groups=('daemons')
depends=('glibc' 'libao' 'openssl' 'avahi')
optdepends=('libpulse: pulse audio support')
provides=('shairport')
conflicts=('shairport' 'shairport-git')
source=('git://github.com/abrasive/shairport.git'
	'shairport.service'
	'shairport.conf')
install="${pkgname}.install"
md5sums=('SKIP'
	'186175bfb4b085433933a0f5c93bf84e'
	'9788280e62b73ed20d53a92c4d42aa06')

build() {
    cd "$srcdir"/shairport
    make
}

package() {
    cd "$srcdir"/shairport
    make PREFIX="$pkgdir/usr" install
    install -Dm644 ../../shairport\.service "${pkgdir}"/usr/lib/systemd/system/shairport\.service
    install -Dm644 ../../shairport\.conf "${pkgdir}"/etc/conf.d/shairport
    install -Dm644 LICENSES "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 README.md "${pkgdir}"/usr/share/doc/${pkgname}/README.md
}
