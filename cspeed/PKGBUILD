# Maintainer: Ryan Peters <sloshy45 _AT_ sbcglobal _DOT_ net>
# Special thanks to 'hbekel' on bbs.archlinux.org for his advice!
# Special thanks also to 'Morris' for his suggestions and bug fixes.
# If you have any bugs with the project, please check out its URL and report them.
pkgname=cspeed
pkgver=0.3.1
pkgrel=1
pkgdesc="A daemon to increase system responsiveness using cgroups."
arch=('any')
url="http://github.com/sloshy/cspeed"
license=('GPL')
depends=('bash')
conflicts=('kernel26>=2.6.38' 'kernel26-bfs' 'kernel26-bfs-eeepc1008' 
'kernel26-ck')
install=cspeed.install
source=("https://github.com/sloshy/$pkgname/tarball/v$pkgver")
md5sums=('a1bfa443088b4b4c69c80af503caf570')

build() {
  cd "$srcdir/sloshy-$pkgname-d93aa43"
  mkdir -p $pkgdir/etc/rc.d
  install -m 755 cspeed $pkgdir/etc/rc.d
  mkdir -p $pkgdir/usr/sbin
  install -m 755 cgroup_clean $pkgdir/usr/sbin
  install -m 644 bash.cgroups $pkgdir/etc
}
# vim:syntax=sh
