# Contributor: Darwin Bautista <djclue917@gmail.com>
# Contributor Stefan Husmann <stefan-husmann@t-online.de>
# Contributor AbdAllah Aly < aaly90 [@] gmail [dot] com >

pkgname=qgnokii
pkgver=0.4.2
pkgrel=6
pkgdesc="Alternative frontend for Gnokii written in QT3"
arch=('i686' 'x86_64')
url="http://qgnokii.sourceforge.net/"
license="GPL"
depends=('gnokii' 'qt3')
install=qgnokii.install
source=(http://downloads.sourceforge.net/sourceforge/qgnokii/${pkgname}-${pkgver}.tar.gz \
        qgnokii.desktop \
        qgnokii.sh \
        qgnokii-0.4.2-string_h.patch gcc4.4.1.patch)
md5sums=('6eadde2786620cf9d2f9ec251553a04b' '58b4f076b9bef873930cac13d485d445'\
         'f88d4b31d006f62f22a4e169d9ad2692' 'd6bf38ca11ca2f152d7b9c56357a2e53'\
         '38d0702cb70d5c3aef2cb356b9fc4f9b')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/

  patch -Np1 -i ../qgnokii-0.4.2-string_h.patch || return 1
  patch -Np1 -i ../gcc4.4.1.patch  || return 1
  # Source the QT profile
  [ -f /etc/profile.d/qt.sh ] && source /etc/profile.d/qt.sh

  sed '/INCLUDEPATH/a   LIBS += -pthread' -i $srcdir/$pkgname-$pkgver/qgnokii.pro
  ${QTDIR}/bin/qmake
#  sed 's/LFLAGS.*/LFLAGS   = -pthread/' -i $srcdir/$pkgname-$pkgver/Makefile
  make || return 1
  msg "gccING"
  gcc ${CFLAGS} qgnokiid.c -o qgnokiid -lgnokii -pthread

  # Install binaries
  install -D -m755 qgnokii ${pkgdir}/usr/bin/qgnokii
  install -D -m755 qgnokiid ${pkgdir}/usr/bin/qgnokiid

  install -D -m755 ../qgnokii.sh ${pkgdir}/etc/profile.d/qgnokii.sh

  # Install menu shortcut
  install -D -m644 ../qgnokii.desktop ${pkgdir}/usr/share/applications/qgnokii.desktop

  # Install needed docs
  install -D -m644 helpfile ${pkgdir}/usr/share/qgnokii/helpfile
  ln -s /usr/share/licenses/common/GPL/license.txt ${pkgdir}/usr/share/qgnokii/LICENSE
}
