# Maintainer: skydrome <irc.freenode.net>
# Contributor: Gour <gour@gour-nitai.com>

pkgname=guitone
pkgver=1.0rc5_20111125
pkgrel=1
pkgdesc="qt frontend for monotone (dev snapshot)"
url="https://code.monotone.ca/p/guitone"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qt' 'monotone>=0.99.1' 'graphviz')
makedepends=()
install=
source=('guitone-snapshot.tar.xz')
sha256sums=('87c7e449618f573cb25183f76023bcf91989d5154bbae8ecae97ce5e70a3d94e')

#The snapshot is from guitone's mtn repo: https://code.monotone.ca/p/guitone/timeline/all
# Nov 25, 2011  Added Japanese translation (thanks to Yuki Morimoto!)
# Commit 3a728afdbd3943b1d86c2a249b1e2ede7bf64c27, by Thomas Keller

build() {
    cd ${srcdir}/${pkgname}
    qmake -config release guitone.pro PREFIX=/usr
    make
    make INSTALL_ROOT=${pkgdir} install
}
