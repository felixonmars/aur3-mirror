# Maintainer: Ninez <triplesquarednine@gmail.com>
pkgname=tuned
pkgver=2.3.0
pkgrel=1
pkgdesc="A dynamic adaptive system tuning daemon"
arch=('any')
url="https://git.fedorahosted.org/cgit/tuned.git"
license=('GPL')
depends=('python2' 'python2-decorator' 'python2-dbus' 'python2-pyudev' 'virt-what' 'python2-configobj' 'ethtool' 'gawk' 'python2-gobject2' )
options=(!emptydirs)
provides=('tuned')
conflicts=('tuned')
replaces=('tuned')
source=("git://git.fedorahosted.org/git/tuned.git")
md5sums=('SKIP')

prepare() {

  cd "$srcdir/tuned"

  # Sed command for python2

  find tuned.py -type f -exec sed -e 's|^#!.*python -Es|#!/usr/bin/env python2|g' -i {} \;
  find tuned-adm.py -type f -exec sed -e 's|^#!.*python -Es|#!/usr/bin/env python2|g' -i {} \;
  find libexec/pmqos-static.py -type f -exec sed -e 's|^#!.*python -Es|#!/usr/bin/env python2|g' -i {} \;
  find experiments/powertop2tuned.py -type f -exec sed -e 's|^#!.*python -Es|#!/usr/bin/env python2|g' -i {} \;
  find experiments/kwin-stop/xlib-example.py -type f -exec sed -e 's|^#!.*python -Es|#!/usr/bin/env python2|g' -i {} \;
  find systemtap/varnetload -type f -exec sed -e 's|^#!.*python -Es|#!/usr/bin/env python2|g' -i {} \;

}

package() {

  cd "$srcdir/tuned"

  make PREFIX="$pkgdir" DESTDIR="$pkgdir"

  make PREFIX="$pkgdir" DESTDIR="$pkgdir" install 

}

# vim:set ts=2 sw=2 et:
