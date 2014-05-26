# Maintainer: Augusto F. Hack <hack.augusto@gmail.com>
pkgname=python2-carbon-git
pkgver=0.9.12
pkgrel=1
pkgdesc="Backend data caching and persistence daemon for Graphite"
arch=('any')
url="https://github.com/graphite-project/carbon"
license=('apache')
depends=('python2' 'python2-twisted' 'python2-whisper-git' 'python2-txamqp')
makedepends=('git' 'python2')
options=(!emptydirs)
source=('carbon::git+https://github.com/graphite-project/carbon.git'
        'carbon.service'
        'carbon.conf')
md5sums=('SKIP'
         '3bfc08f9e8193cec26c41febc3f50e90'
         '78adf75d1815223fa93190f657becaaa')
pkgver() {
  cd "$srcdir/repo"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/carbon"
  python2 setup.py install --root="$pkgdir/" --install-lib=/usr/lib/python2.7/site-packages --install-data=/var/lib/graphite --install-scripts=/usr/bin --optimize=1
  install -D -m644 $srcdir/carbon.service $pkgdir/usr/lib/systemd/system/carbon.service

  # change the directory of the config files
  ls conf | while read conf; do
    install -D -m644 conf/$conf $pkgdir/etc/carbon/${conf/.example}
  done;
  rm -r $pkgdir/var

  # use our config with FHS
  install -D -m644 $srcdir/carbon.conf $pkgdir/etc/carbon/carbon.conf
}

# vim:set ts=2 sw=2 et:
