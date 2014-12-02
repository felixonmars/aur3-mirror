# Maintainer: jfperini <@jfperini>
# Contributor: jfperini <@jfperini>

pkgname=qremotecontrol-server-git
pkgver=2.4.2+r54.8f1c55e
pkgrel=1
pkgdesc="QRemoteControl is a remote control application for your mobile phone. This is the server part of QRemoteControl."
url="http://sourceforge.net/projects/qrc"
arch=('any')
license=('GPL v3')
depends=('qt4')
makedepends=('git')
conflicts=('qremotecontrol-server')
provides=('qremotecontrol-server')
source=("$pkgname"::'git+http://git.code.sf.net/p/qrc/gitcode')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {

    cd "$srcdir/$pkgname/"

    # Use the tag of the last commit
    printf "2.4.2+r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    
    cd "$srcdir/$pkgname/"
    
    qmake-qt4
    
}

build() {
  
    cd "$srcdir/$pkgname"
    
    msg2 "  -> Build program..."
    make   CXXFLAGS+="$CXXFLAGS -W -D_REENTRANT \$(DEFINES)" LDFLAGS+="$LDFLAGS"
    
}

package() {

    cd "$srcdir/$pkgname"
    
    msg2 "  -> Installing program..."
    make INSTALL_ROOT="$pkgdir" install
    
}
