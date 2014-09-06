# Contributor: Vigneshwaran P <vigneshchennai@live.in>
pkgname=jvpn
pkgver=0.7.0
pkgrel=1
pkgdesc='jvpn.pl - script to connect to the Juniper firewall with enabled HostChecker.'
_dist=v
arch=('any')
url="https://github.com/samm-git/jvpn"
license=('GPL' 'PerlArtistic')
depends=(perl perl-term-readkey perl-lwp-protocol-https)
options=('!emptydirs' purge)
source=("https://github.com/samm-git/jvpn/archive/$_dist$pkgver.tar.gz" jvpn)
md5sums=("7fa5b01dee4835be5eeec00e57bb6e1d"
            "8e003deaa552a411d3aeabc3be3f6ceb")
backup=('etc/jvpn/jvpn.ini')

build() (
    :
)

check() (
    :
)

package() (
  cd "$srcdir/jvpn-$pkgver"
  mkdir -p "$pkgdir/usr/bin/"
  cp jvpn.pl "$pkgdir/usr/bin/jvpn.pl"
  cp ../jvpn "$pkgdir/usr/bin/jvpn"
  mkdir -p "$pkgdir/etc/jvpn/"
  cp jvpn.ini "$pkgdir/etc/jvpn/jvpn.ini"
  mkdir -p "$pkgdir/usr/share/jvpn"
  cp -r scripts "$pkgdir/usr/share/jvpn"
  cp CHANGELOG "$pkgdir/usr/share/jvpn"
  cp FAQ "$pkgdir/usr/share/jvpn"
  cp README "$pkgdir/usr/share/jvpn"
)

