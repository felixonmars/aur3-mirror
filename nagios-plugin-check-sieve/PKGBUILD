# Maintainer: Markus Heuser <markus.heuser@web.de>
pkgname=nagios-plugin-check-sieve
pkgver=1.01
pkgrel=1
pkgdesc="A Nagios plugin to check sieve availability"
arch=(any)
url="http://exchange.nagios.org/directory/Plugins/Email-and-Groupware/Others/check_sieve-2Epl/details"
license=('GPL')
groups=()
depends=(nagios perl-try-tiny perl-io-socket-inet6 perl-nagios-plugin)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://www.sendersuchlauf.net/~sysop/check_sieve.pl")
noextract=()
md5sums=('c4a8cfadf764075113f03b953898a51b')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/nagios/libexec"
  chmod 775 "$pkgdir/usr/share/nagios/libexec"
  install -Dm=755 check_sieve.pl "$pkgdir/usr/share/nagios/libexec/check_sieve.pl"
}
