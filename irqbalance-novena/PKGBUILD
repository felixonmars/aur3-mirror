# Novena version of irqbalance.
# Maintainer: Brandon Edens <brandonedens@gmail.com>

_reponame=irqbalanced
_basename=irqbalance
pkgname=irqbalance-novena
#pkgbase=$pkgname-git
pkgver=0.56.r2.0.gd5fb649
pkgrel=1
pkgdesc='IRQ balancing daemon for SMP systems built for Novena'
arch=('armv7h')
url="https://github.com/xobs/irqbalanced/"
license=('GPL2')
makedepends=('git sed')
provides=("irqbalance")
conflicts=("irqbalance" "$pkgname")
source=("git+https://github.com/xobs/irqbalanced.git"
  'irqbalance.service')
md5sums=('SKIP'
         'a519a210d67c6240c327426637ea720a')

pkgver() {
  cd "$srcdir/$_reponame"
  git describe --long --tags | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/$_reponame"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_reponame"
  install -D -m755 irqbalance "$pkgdir"/usr/bin/irqbalance
  install -D -m644 ../irqbalance.service "$pkgdir"/usr/lib/systemd/system/irqbalance.service                                                                          

}

# vim:set ts=2 sw=2 et:
