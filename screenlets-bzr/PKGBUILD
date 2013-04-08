# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=screenlets-bzr
pkgver=0.1.7.839.9343bdb
pkgrel=1
pkgdesc="Widget framework that consists of small owner-drawn applications (bzr version)"
arch=('any')
url="http://screenlets.org/"
license=('GPL3')
depends=('python2-beautifulsoup3' 'python2-dbus' 'python2-gconf'
         'python2-gnomekeyring' 'python2-rsvg' 'pywebkitgtk' 'python2-wnck'
         'python2-xdg' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('bzr')
optdepends=('screenlets-pack-basic: Desktop widgets'
            'screenlets-pack-full-bzr: Desktop widgets (all of them)')
provides=('screenlets')
conflicts=('screenlets')
install=screenlets-bzr.install
source=(screenlets::bzr+http://bazaar.launchpad.net/~screenlets-dev/screenlets/trunk)
md5sums=('SKIP')

pkgver() {
    cd screenlets
    echo $(cat VERSION).$(bzr revno).$(bzr testament | awk '/sha1/ { print $2 }' | head -c7)
}
package() {
  cd screenlets
  
  # Fix python2
  find . -name \*.py -exec sed -i 's@/usr/bin/python@/usr/bin/python2@' {} \;
  find . -name \*.py -exec sed -i 's@/usr/bin/env python@/usr/bin/python2@' {} \;
  sed -i 's/python -u/python2 -u/' \
        src/bin/* \
        src/lib/*.py \
        src/share/screenlets-manager/*.py
  
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
