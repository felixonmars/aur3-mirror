# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Jon Sturm <Jasturm002@aol.com>

_pkgname=gfm
pkgname=$_pkgname-svn
pkgver=1.07.4505
pkgrel=1
pkgdesc="Group File Manager for TI graphing calculator Group Files - .8*g/.tig (svn version)"
arch=(i686 x86_64)
url=http://lpg.ticalc.org/prj_gfm/
http://tilp.info/
license=(GPL2)
depends=(desktop-file-utils libglade libticalcs)
makedepends=(subversion)
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
options=(!libtool)
install=$pkgname.install
source=($pkgname::svn+http://svn.tilp.info/repos/tilp/$_pkgname/trunk
    $pkgname.desktop)
sha256sums=('SKIP'
    'bb83b95fcecf25ac64a8c156df6d4bcc0b9d41eca408052b5d3d8e08c78c3d43')
sha512sums=('SKIP'
    '1848a9b3877f9777a4fbfb793707874db27386b7b605610c5a7b9ea62f50705ec22fdadc8d4c7fa1f5ccc4fee19674bacb033f0125d0f3e0b409d123106d4f33')

pkgver() {
    echo $(grep -o 'version [0-9.]\+' -m1 $pkgname/ChangeLog | tr -d '[a-zA-Z ]').$(svnversion "$SRCDEST"/$pkgname/)
}

prepare() {
    cd $pkgname/
    sed -i 's:.*serial.*::g' acinclude.m4
    echo '# serial 1' > acinclude.m4.new
    cat acinclude.m4 >> acinclude.m4.new
    mv acinclude.m4{.new,}
}

build() {
    cd $pkgname/
    autoreconf -fi
    #KDE users can remove the --without-kde option to enable kde file dialogs
    ./configure --prefix=/usr --without-kde
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
    desktop-file-install $pkgname.desktop --dir "$pkgdir"/usr/share/applications/
    cd "$pkgdir"/usr/share/
    install -d pixmaps/
    ln -s /usr/share/$_pkgname/pixmaps/$_pkgname.xpm pixmaps/
}
