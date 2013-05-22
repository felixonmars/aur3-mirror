pkgname=('ktap-git')
true && pkgname=('ktap-git' 'ktap-utils-git')
pkgrel=1
pkgver=20130522
pkgdesc='KTAP kernel module and userpace tool'
arch=('i686' 'x86_64')
url='https://github.com/ktap/ktap'
license=('GPL')
makedepends=('git')
md5sums=('SKIP')
_gitname='ktap'
source="$_gitname::git+https://github.com/ktap/ktap.git"

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
    cd $_gitname
    pwd
    make
    make ktap
}

package_ktap-git() {
    depends=('linux')
    install='ktap-git.install'
    cd $_gitname
    install -d $pkgdir/usr/lib/modules/$(uname -r)/kernel/misc/
    install -m 644 -o root -g root -p ktapvm.ko $pkgdir/usr/lib/modules/$(uname -r)/kernel/misc/
}

package_ktap-utils-git() {
    true && depends=("ktap-git=$pkgver")
    cd $_gitname
    install -d $pkgdir/usr/bin/
    install -d $pkgdir/usr/share/doc/ktap/examples/
    install -m 755 -o root -g root -p ktap $pkgdir/usr/bin/
    install -m 644 -o root -g root -p doc/* $pkgdir/usr/share/doc/ktap/
    install -m 644 -o root -g root -p scripts/* $pkgdir/usr/share/doc/ktap/examples/
}
