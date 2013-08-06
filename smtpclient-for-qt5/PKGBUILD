# Maintainer: Christian Bühler <christian@cbuehler.de>
pkgname=smtpclient-for-qt5
pkgver=95.2b67152
pkgrel=1
pkgdesc="An SMTP Client writen in C++ for Qt."
arch=('i686' 'x86_64')
url="https://github.com/bluetiger9/SmtpClient-for-Qt"
license=('LGPL')
depends=('qt5-base')
makedepends=('git')
source=(git+https://github.com/bluetiger9/SmtpClient-for-Qt#branch=dev)
md5sums=('SKIP')

pkgver() {
  cd SmtpClient-for-Qt
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/SmtpClient-for-Qt/src"
  qmake
  make
}

package() {
  cd "$srcdir/SmtpClient-for-Qt/src"
  mkdir -p "${pkgdir}/usr/"{include,lib}
  cp *.h SmtpMime "${pkgdir}/usr/include"
  cp libSmtpMime.so.1.0.0 "${pkgdir}/usr/lib"
  cd "${pkgdir}/usr/lib"
  ln -s libSmtpMime.so.1.0.0 libSmtpMime.so
  ln -s libSmtpMime.so.1.0.0 libSmtpMime.so.1
  ln -s libSmtpMime.so.1.0.0 libSmtpMime.so.1.0
}

# vim:set ts=2 sw=2 et:
