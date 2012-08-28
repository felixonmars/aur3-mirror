# Contributor: udvzsolt < udvzsolt gmail com >
# Based on package `sysvinit'

pkgname=systemd-sysvinit
_pkgname=sysvinit
pkgver=2.88
pkgrel=6
pkgdesc="Some tools from sysvinit (last, lastb, wall, pidof)"
arch=('i686' 'x86_64')
url="http://savannah.nongnu.org/projects/sysvinit"
license=('GPL')
groups=('base')
depends=('shadow' 'util-linux' 'coreutils' 'glibc' 'awk')
makedepends=('asciidoc')
conflicts="sysvinit"
source=(
    http://download.savannah.gnu.org/releases/sysvinit/${_pkgname}-${pkgver}dsf.tar.bz2
)
md5sums=('6eda8a97b86e0a6f59dabbf25202aa6f')
sha1sums=('f2ca149df1314a91f3007cccd7a0aa47d990de26')

_progs="last wall"
_sbin_progs="killall5 sulogin"

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}dsf/src"
  make ${_progs} ${_sbin_progs}
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}dsf"
  install -d $pkgdir/{{,usr/}bin/,sbin}

  cd src
  install -m755 ${_progs} $pkgdir/usr/bin
  install -m755 ${_sbin_progs} $pkgdir/sbin

  cd ../man
  install -d $pkgdir/usr/share/man/man{1,7,8}
  for manpage in ${_progs} ${_sbin_progs} lastb pidof; do
      section=$(ls $manpage.* | sed "s@[^\.]*\.@@")
      install -m644 $manpage.* $pkgdir/usr/share/man/man${section}
  done

  cd $pkgdir/usr/bin
  ln -s last lastb
  cd $pkgdir/bin
  ln -s ../sbin/killall5 pidof
}
