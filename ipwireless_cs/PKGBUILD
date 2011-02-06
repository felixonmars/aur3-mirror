## Contributor: Jazz <mainiak@gmail.com>
pkgname=ipwireless_cs

## I have added (my) latest functional kernel version number
pkgver=2.6.22

## GIT version (?)
_ver=2.6.21_2.6.20
_kernel="`uname -r`"

pkgrel=2
pkgdesc="IPWireless 3G PCMCIA Network Driver"
arch=('i686')
url="http://jikos.jikos.cz/"
## same as kernel I suppose ;-)
license=('GPL')
groups=()

depends=()

makedepends=('kernel-headers')
## Or not? ^^^

provides=()
conflicts=()
replaces=()
backup=()
options=()
install="install"

## latest version is in 'ipw-devel' branch
## http://git2.kernel.org/git/?p=linux/kernel/git/jikos/ipwireless_cs.git;a=summary
## git://git.kernel.org/pub/scm/linux/kernel/git/jikos/ipwireless_cs.git

source=("ftp://ftp.kernel.org/pub/linux/kernel/people/jikos/ipwireless_cs/$pkgname-$_ver.tar.bz2"
        "ftp://ftp.kernel.org/pub/linux/kernel/people/jikos/ipwireless_cs/$pkgname-$_ver.tar.bz2.sign")
noextract=()
md5sums=('f5933d71fb0ef9556064b8d5aa36b3c8'
         'a02b29ebbae75354348520ab31040ae4')

build() {
    _dest="$startdir/pkg/lib/modules/$_kernel/kernel/drivers/char/pcmcia"
    mkdir -p "${_dest}"

    cd "$startdir/src/$pkgname-${_ver}"
    make || return 1
    
    cp ipwireless_cs.ko "${_dest}/"
}

# vim:set ts=4 sw=4 et:
