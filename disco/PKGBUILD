# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Yejun Yang (yejunx AT gmail DOT com)

pkgname=disco
pkgver=0.4
pkgrel=1
pkgdesc="Open-source implementation of the Map-Reduce framework for distributed computing"
arch=('any')
url="http://discoproject.org/"
license=('custom:BSD')
depends=(erlang openssh python2 python-cjson)
makedepends=(setuptools)
backup=(etc/disco/settings.py)
install=disco.install
source=(https://github.com/tuulos/$pkgname/tarball/$pkgver
        disco-master
        disco-node)

md5sums=('142ec90b5ea46e13b5898f9e823c554c'                                                                                                                                                                                      
         '98a2953fba3a0946b7e319b3be47d487'                                                                                                                                                                                      
         'b241a00d78b193a756d8c58907851287')

build() {
  cd "$srcdir"/*/

  make PYTHON=python2

  cd bin
    for script in *.py
    do
      sed --expression='s/python$/python2/' --in-place "$script"
    done
  cd ..
}

package() {
  cd "$srcdir"/*/

  install --directory "$pkgdir/etc/rc.d"
  make \
    DESTDIR="$pkgdir" \
    PYTHON=python2 \
    INSTALL=/bin/install \
    prefix=/usr \
    localstatedir=/var \
  install

  sed --expression='s/DISCO_HOME = .*/DISCO_HOME = "\/usr\/lib\/disco"/' \
      --expression='s/DISCO_ROOT = .*/DISCO_ROOT = "\/var\/disco"/' \
      --in-place "$pkgdir/etc/disco/settings.py"

  install --directory "$pkgdir/var/disco/data"
  install --directory "$pkgdir/var/disco/log"
  install --directory "$pkgdir/var/disco/run"

  install --directory "$pkgdir/usr/share/licenses/$pkgname"
  install --mode=755 "$srcdir/disco-master" "$pkgdir/etc/rc.d/"
  install --mode=755 "$srcdir/disco-node" "$pkgdir/etc/rc.d/"
  install --mode=755 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}
