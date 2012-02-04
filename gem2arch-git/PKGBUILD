# Contributor: Juan Diego Tascon

pkgbase=gem2arch
pkgname=$pkgbase-git
pkgver=20100304
pkgrel=3
pkgdesc="Program for automatically creating a PKGBUILD for the Arch package management system"
arch=("any")
url="http://github.com/abhidg/gem2arch/"
license=('specific')
depends=("python-yaml")
makedepends=('git')
provides=("$pkgbase")

_gitroot="git://github.com/abhidg/gem2arch.git"
_gitname="gem2arch"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."
    
    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi
    
    msg "GIT checkout done or server timeout"
    msg "Starting make..."
    
    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"
    
    install -d -m755 $pkgdir/usr/{bin,lib/$pkgbase,share/licenses/$pkgbase}
    
    install -m755 gem2arch $pkgdir/usr/lib/$pkgbase
    install -m644 pkgbuild.py $pkgdir/usr/lib/$pkgbase
    install -m644 version.py $pkgdir/usr/lib/$pkgbase
    install -m644 README $pkgdir/usr/lib/$pkgbase
    install -m644 LICENSE  $pkgdir/usr/share/licenses/$pkgbase
    
    ln -s ../lib/$pkgbase/gem2arch $pkgdir/usr/bin/gem2arch
}

