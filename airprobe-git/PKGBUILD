# Maintainer: onny <onny@project-insanity.org>
# Contributor: onny <onny@project-insanity.org>

pkgname=airprobe-git
pkgver=20110514
pkgrel=1
pkgdesc="An air-interface analysis tool for the GSM mobile phone standard."
arch=('i686' 'x86_64')
url="https://svn.berlin.ccc.de/projects/airprobe/"
license="GPL3"
makedepends=('git' 'make' 'gcc')
backup=()

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

    git clone git://git.gnumonks.org/airprobe.git

  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  
} 
package () {
  mkdir -p $pkgdir/opt/airprobe
  cp -r $srcdir/airprobe/* $pkgdir/opt/airprobe
}
