# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Marcel W. Wysocki <maci@satgnu.net>
# Contributor: Philipp Robbel <robbel@gmail.com>

pkgname=insight
pkgver=6.8
pkgrel=4
pkgdesc="graphical interface to the GNU debugger"
arch=('i686' 'x86_64')
url="http://sources.redhat.com/insight/"
license=('GPL')
depends=('libx11')
install=insight.install
source=(ftp://sourceware.org/pub/insight/releases/${pkgname}-${pkgver}-1a.tar.bz2 insight.profile)
md5sums=('f7dd764a102beb75c2bb6b8d83455f8e' '16dddd252c8d64a1f4757626ee895b03')


build() {
  cd $srcdir/${pkgname}-${pkgver}-1
  ./configure --prefix=/opt/insight --mandir=/opt/insight/share/man --infodir=/opt/insight/share/info --disable-werror
  make
}

package() {
  cd $srcdir/${pkgname}-${pkgver}-1
  make prefix=$pkgdir/opt/insight mandir=$pkgdir/opt/insight/share/man infodir=$pkgdir/opt/insight/share/info install
  rm -rf $pkgdir/opt/insight/share/info

  # environment variables
  mkdir -p ${startdir}/pkg/etc/profile.d
  install -m755 ${srcdir}/${pkgname}.profile $pkgdir/etc/profile.d/${pkgname}.sh
}
