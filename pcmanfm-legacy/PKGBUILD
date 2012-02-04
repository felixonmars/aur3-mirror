# Maintainer: Robert McCathie <archaur at rmcc dot com dot au>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=pcmanfm-legacy
pkgver=0.5.2
pkgrel=1
pkgdesc="File manager of the LXDE Desktop (legacy version)"
arch=('i686' 'x86_64')
url="http://pcmanfm.sourceforge.net/"
license=('GPL')
depends=('gtk2' 'hal' 'fam' 'startup-notification' 'shared-mime-info' 'desktop-file-utils')
makedepends=('intltool' 'pkgconfig')
conflicts=('pcmanfm')
provides=('pcmanfm')
install=pcmanfm.install
source=(http://downloads.sourceforge.net/pcmanfm/pcmanfm-$pkgver.tar.bz2 0001-remove-invalid-trailing-newline-in-msgstr.patch gtk220workaround.patch)
md5sums=('750f89cbe7496e5f4c09e4c5a95dec6e' '80c9b6327bc664dcae6882a42a27a940' '81636e89aac6fbbe1d983a4276ef1d3c')
build() {
  cd "$srcdir/pcmanfm-$pkgver"
	patch -p1 -i $srcdir/0001-remove-invalid-trailing-newline-in-msgstr.patch || return 1
    # IgnorantGuru's GTK 2.20 workaround
    patch -p0 < $srcdir/gtk220workaround.patch || return 1
  ./configure --sysconfdir=/etc --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
