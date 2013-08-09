pkgname=dotdotpwn
pkgver=3.0
pkgrel=5
pkgdesc="DotDotPwn is a Directory Traversal Fuzzer for web applications"
url="http://dotdotpwn.sectester.net/"
arch=('any')
license=("GPL3")
depends=('perl' 'perl-http-lite' 'perl-switch' 'perl-time-hires' 'perl-libnet' 'perl-tftp' 'perl-io-socket' 'perl-socket')
optdepends=('nmap')
source=("http://www.brainoverflow.org/code/$pkgname-v$pkgver.tar.gz")
sha512sums=('1490f96b9b79d689ffb24f1c45239220ffe3ce18fc69751abfa3e6c5e22c968ff98fd3378b2507bdc38703e8678a8b6301143d4de6c15fefa34bfc67f651529e')

package() {
	mkdir -p $pkgdir/opt/dotdotpwn
	mkdir -p $pkgdir/usr/bin
	cp -r $srcdir/dotdotpwn-v${pkgver}/* $pkgdir/opt/dotdotpwn/
        echo -e "#!/bin/bash\ncd /opt/dotdotpwn\n perl /opt/dotdotpwn/dotdotpwn.pl \$@" > $pkgdir/usr/bin/dotdotpwn
        chmod a+x $pkgdir/usr/bin/dotdotpwn
	chmod a+x $pkgdir/opt/dotdotpwn/dotdotpwn.pl

}
