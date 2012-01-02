# Maintainer : Alucryd <alucryd at gmail dot com>
pkgname=aegisub-svn
pkgver=6189
pkgrel=1
pkgdesc="A general-purpose subtitle editor with ASS/SSA support"
arch=('i686' 'x86_64')
url="http://www.aegisub.net"
license=('GPL' 'BSD')
depends=('ffmpegsource2-svn' 'lua' 'wxgtk-2.9' 'hunspell' 'libass' 'fftw' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('imagemagick' 'subversion' 'intltool')
provides=('aegisub')
conflicts=('aegisub-bin' 'aegisub-stable-svn')
source=('base.patch' 'automation.patch' 'desktop.patch' 'po.patch')
md5sums=('49672af4ccc35fe2d9514d7542ecc3b5' '3f288d301bb60bc5d0a32dd657cc671f' 'f394c239b6897f770bdc9325e1a9e2fd' '4ed1f7d183fc59d99d9a09562ab8e456')
install=icon.install

_svntrunk=http://svn.aegisub.org/trunk/aegisub/
_svnmod=aegisub


build() {
    cd "$srcdir"
    msg "Connecting to SVN server...."
    if [[ -d "$_svnmod/.svn" ]]; then
        (cd "$_svnmod" && svn up -r "$pkgver")
    else
        svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
    fi
    msg "SVN checkout done or server timeout"
    
# Applying DESTDIR patches
    patch -p0 < base.patch
    patch -p0 < automation.patch
    patch -p0 < desktop.patch
    patch -p0 < po.patch

    cd "$_svnmod"
    ./autogen.sh --prefix=/usr --without-{portaudio,openal,oss,pulseaudio} --with-wxdir=/usr/include/wx-2.9 --with-wx-config=/usr/bin/wx-config-2.9
    make
}

package() {
    cd "${srcdir}/$_svnmod"
    make DESTDIR="$pkgdir" install
}

