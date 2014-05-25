# Maintainer: Augusto F. Hack <hack.augusto@gmail.com>
pkgname=statsite-git
pkgver=0.6.5
pkgrel=1
pkgdesc="Simple daemon for easy stats aggregation compatible statsd"
arch=('x86_64')
url="http://armon.github.io/statsite/"
license=('custom')
depends=()
optdepends=('python2' 'ruby')
makedepends=('git' 'scons')
options=(!emptydirs)
source=('statsite::git+https://github.com/armon/statsite.git'
        'statsite.conf'
        'statsite.service')
md5sums=('SKIP'
         '3135aaacf6d6e8ff7b224468756164e2'
         '589a93a5d8b8e1e697df87d5e9f78308')


pkgver() {
  cd "$srcdir/repo"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/statsite"
  make

  install -D -m644 $srcdir/statsite.conf $pkgdir/etc/statsite.conf
  install -D -m644 $srcdir/statsite.service $pkgdir/usr/lib/systemd/system/statsite.service
  install -D statsite $pkgdir/usr/bin/statsite
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/stastie/LICENSE

  cd sinks
  ls | while read sink; do
    install -D $sink $pkgdir/usr/bin/statsite_${sink#statsite_}
  done
}

# vim:set ts=2 sw=2 et:
