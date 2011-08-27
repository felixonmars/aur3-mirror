# Maintainer: Henry Jensen <hjensen@delilinux.de>

pkgname=redirfs-bin
pkgver=0.6
pkgrel=1
pkgdesc="Redirecting FileSystem with Anti-Virus Filter - Binaries"
arch=('i686' 'x86_64')
url="http://www.redirfs.org"
license=('unknown')
depends=('glibc' 'redirfs-modules' 'redirfs-lib')
source=(http://www.redirfs.org/packages/rfsctl-0.1.tar.gz \
	http://www.redirfs.org/packages/avfltctl-0.2.tar.gz \
	http://www.redirfs.org/packages/avtest-0.1.tar.gz \
        )
md5sums=('ed53bc7748956d68b616a5e5c42e7f10'
         'ffb7589ad9dc132d62f6c103ae2ff10b'
         'c3e420fb624885c5a80b39bcfbe86e31')

build() {
  mkdir -p "$pkgdir"/usr/bin

  cd "$srcdir/rfsctl-0.1"
  make || return 1
  cp rfsctl "$pkgdir"/usr/bin
  
  cd "$srcdir/avfltctl-0.2"
  make || return 1
  cp avfltctl "$pkgdir"/usr/bin
  
  cd "$srcdir/avtest-0.1"
  make || return 1
  cp avtest "$pkgdir"/usr/bin
  
}

