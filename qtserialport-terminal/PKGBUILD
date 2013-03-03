# Maintainer : axlrose <3444542@163.com>

pkgname=qtserialport-terminal
pkgver=0.41
pkgrel=2
_pkgdate="2003-10-08"
pkgdesc="This program is a serial port RS232 terminal. It is based on QExtSerialPort 1.1"
url="http://www.qt-apps.org/content/show.php/QTSerialPortTerminal?content=77764"

groups=("devel")
P="${pkgname}-${pkgver}"
source=("http://www.qt-apps.org/CONTENT/content-files/77764-QTSerialPort%${_pkgdate}.zip")

arch=("i686" "x86_64")
makedepends=("")
options=('emptydirs')
backup=()
depends=('qt4')

license=('GPL-2')

md5sums=('8f454aea93f9d615d2c7b1adf5efba6e')

build() {
    cd ${srcdir}
    qmake-qt4 || return 1
	make || return 1
	make DESTDIR="${pkgdir}" install || return 1
    install -Dm0755 QSerialPortTerminal ${pkgdir}/usr/bin/${pkgname} || return 1
}
