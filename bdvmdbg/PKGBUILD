# Maintainer: Christophe Robin <crobin@nekoo.com>

pkgname=bdvmdbg
pkgver=0.1.5
_pkgver=0.1.5-dmo1
pkgrel=2
pkgdesc="BDVM Debugger is a Java-based, cross-platform BDVM debugger utility for Blu-Ray discs."
arch=(any)
url='http://forum.doom9.org/showthread.php?t=140571'
license=('MIT')
depends=('java-runtime')
source=("http://deb-multimedia.org/pool/main/b/${pkgname}/${pkgname}_${_pkgver}_all.deb")
md5sums=('c38cb3fb0e6c6ca4dc01017460c1f225')

package() {
    cd "$pkgdir" || return 1

    tar xjvf "$srcdir/data.tar.bz2"
}

# vim:set ts=4 sw=4 et:
