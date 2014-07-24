# Maintainer: Soulo <leo@soulou.fr>
 
pkgname=yad-svn
pkgver=r772
pkgrel=2
pkgdesc="Display graphical dialogs from shell scripts or command line"
url="http://sourceforge.net/projects/yad-dialog/"
arch=('i686' 'x86_64' 'armv6h' 'armv5h' 'armv7h')
conflicts=('yad')
license=('GPL2')
depends=('bash' 'gtk2' 'gettext' 'intltool' 'hicolor-icon-theme' )
provides=("yad-svn=$pkgver" "yad")
 
install='yad.install'
source=('svn://svn.code.sf.net/p/yad-dialog/code/trunk')
sha1sums=('SKIP')
 
pkgver() {
    cd "$srcdir/trunk"
    local ver="$(svnversion)"
    printf "r%s" "${ver//[[:alpha:]]}"
}
 
build() {
    cd "${srcdir}/trunk"
    export LDFLAGS='-lX11' 
    autoreconf -i
    ./configure --prefix=/usr
    make
}
 
package() {
    cd "${srcdir}/trunk"
    make prefix="${pkgdir}/usr" install
    rm "${pkgdir}/usr/share/icons/hicolor/icon-theme.cache"
}
