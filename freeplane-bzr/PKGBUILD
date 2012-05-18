# Maintainer: Mamoru HIRAI <mamoru_h at leto dot eonet dot ne dot jp>

pkgname=freeplane-bzr
pkgver=2953
pkgrel=1
pkgdesc="A free mindmapping and knowledge management tool"
arch=('i686' 'x86_64')
url="http://freeplane.sourceforge.net"
license=('GPL')
makedepends=('bzr' 'apache-ant')
depends=('java-runtime' 'bash' 'libxtst')
conflicts=('freeplane')
source=('freeplane.desktop' 'freeplane.run')
md5sums=('0029de45c5e261d5bed8ffc5635562d1'
         '38e9a44d0f1e98afe0afd7ebedc0ffe4')

_bzrtrunk="bzr://freeplane.bzr.sourceforge.net/bzrroot/freeplane/freeplane_program/trunk"
_bzrmod=freeplane
_builddir=$srcdir/freeplane/freeplane_framework/build
_antdir=$srcdir/freeplane/freeplane_framework/ant
_ant_path=/usr/bin/ant

build() {

    cd $srcdir

    if [[ -d $_bzrmod ]]; then
	cd $_bzrmod
	bzr pull $_bzrtrunk -r $pkgver
    else
	bzr branch $_bzrtrunk $_bzrmod -r $pkgver
    fi

    cd $_antdir
    export ANT_HOME=/usr/share/apache-ant
    $_ant_path clean
    $_ant_path build || ($_ant_path format-translation && $_ant_path build)
}

package() {

    mkdir -p $pkgdir/usr/share
    cp -r $_builddir $pkgdir/usr/share/$pkgname

    cd $pkgdir/usr/share/$pkgname
    rm *.exe *.bat

    mkdir -p $pkgdir/usr/bin

    install -Dm755 $srcdir/freeplane.run $pkgdir/usr/bin/freeplane
    install -Dm644 $srcdir/freeplane.desktop $pkgdir/usr/share/applications/freeplane.desktop
    install -Dm644 $_builddir/freeplane.svg $pkgdir/usr/share/pixmaps/freeplane.svg
    install -Dm644 $_builddir/freeplane.png $pkgdir/usr/share/pixmaps/freeplane.png
}
