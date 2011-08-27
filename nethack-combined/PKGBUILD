# $Id: PKGBUILD 9316 2008-08-17 06:12:33Z allan $
# Maintainer : Jeremy O'Brien <piroko@archlinux.org>

pkgname=nethack-combined
pkgver=3.4.3
pkgrel=3
pkgdesc='Nethack with Jukka Lahtinens combined patch applied, and some sane defaults'
arch=('i686' 'x86_64')
url="http://www.nethack.org/index.html"
license=('custom')
depends=('ncurses' 'gzip')
provides=('nethack')
source=(http://downloads.sourceforge.net/sourceforge/nethack/nethack-343-src.tgz
		nh343jl-combined-full.diff)
md5sums=('21479c95990eefe7650df582426457f9'
		 '772bc9c958a98932654d71069d7360ee')

build(){
  cd "${srcdir}/nethack-${pkgver}"
  patch -Np1 -i "${srcdir}/nh343jl-combined-full.diff" || return 1
  make || return 1
  make PREFIX=$startdir/pkg/usr install
  sed -e 's|HACKDIR=.*/pkg/usr/|HACKDIR=/usr/|' -i $startdir/pkg/usr/bin/nethack
  install -Dm644 dat/license $startdir/pkg/usr/share/licenses/$pkgname/license
}
