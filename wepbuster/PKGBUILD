# Maintainer: Max Roder <maxroder@web.de>
# Contributor: Lex Rivera

pkgname=wepbuster
pkgver=1.0_beta_0.7
pkgrel=6
pkgdesc="The script executes various programs included in the aircrack-ng suite - a set of tools for auditing wireless networks, in order to obtain the WEP encryption key of a wireless access point."
arch=('any')
url="http://code.google.com/p/wepbuster/"
license=('BSD')
depends=('aircrack-ng' 'perl-term-readkey' 'perl-expect' 
		'perl-file-slurp' 'macchanger' 'dhclient' 
		'perl-algorithm-permute' 'perl-number-range')
source=("http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tgz")
sha256sums=('d84de7c7495a788da42e5adeaaa56fe5eed7be383b369398f8353ce2585c5f06')

package() {
    cd "$srcdir/$pkgname-1.0_beta"
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname || return 1
}

# vim:set ts=2 sw=2 et: