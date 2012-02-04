# Maintainer: Marco Yuen <marcoy@gmail.com>
pkgname=jswat
pkgver=4.5
pkgrel=1
pkgdesc="A graphical Java debugger front-end"
arch=('i686' 'x86_64')
url="http://code.google.com/p/jswat/"
license=('CDDL')
depends=('java-environment' 'bash')
makedepend=('unzip' 'sed')
options=(!strip)

source=(http://jswat.googlecode.com/files/jswat-4.5-installer.jar \
        jswat)
md5sums=('5fed3cb9f088b7fbc709e9922396ca59'
         '866e2d5368f4df629437ed66ac4f2013')

build() {
    mkdir -p $pkgdir/opt/jswat
    unzip $srcdir/jswat.zip -d $pkgdir/opt/jswat
    sed -i 's|C:\\java\\jdk1.6.0|'${JAVA_HOME}'|' $pkgdir/opt/jswat/etc/jswat.conf
    sed -i 's|${HOME}\\.jswat|${HOME}/.jswat|' $pkgdir/opt/jswat/etc/jswat.conf
    chmod 755 $pkgdir/opt/jswat/bin/jswat
    chmod 755 $pkgdir/opt/jswat/bin/jpdalaunch

    rm -f $pkgdir/opt/jswat/bin/*.exe

    mkdir -p $pkgdir/usr/bin/
    install -m 755 $srcdir/jswat $pkgdir/usr/bin
}
