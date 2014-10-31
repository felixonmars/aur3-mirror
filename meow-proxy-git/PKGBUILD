# Maintainer: renzhn <renznn@gmail.com>
pkgname=meow-proxy-git
pkgver=1010.840420a
pkgrel=1
pkgdesc="MEOW is a fork of MEOW that uses whitelist mode"
arch=('i686' 'x86_64' 'arm')
url="https://github.com/renzhn/MEOW"
license=('custom')
depends=()
makedepends=('go' 'mercurial' 'git')
source=('meow@.service'
        'meow_user.service'
	'git://github.com/renzhn/MEOW.git')

sha1sums=('bf9f1c5c58807e39c969d1ec5cb6535579f0dc92'
          '4ab8d5afaf78c992bdd7c45a7fcd7dd4ae3875d5'
          'SKIP')

conflicts=(meow-proxy)

_gitname=meow
install=$pkgname.install

pkgver() {
        cd "${srcdir}/${_gitname}"
        echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	mkdir -p ${srcdir}/src/github.com/renzhn/MEOW
        cd "${srcdir}/${_gitname}"
	git --work-tree=${srcdir}/src/github.com/renzhn/MEOW checkout -f master
	cd ${srcdir}/src/github.com/renzhn/MEOW
	GOPATH=${srcdir} go get -v
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -m755 $srcdir/bin/meow $pkgdir/usr/bin/meow
  install -Dm644 meow@.service ${pkgdir}/usr/lib/systemd/system/meow@.service
  install -Dm644 meow_user.service ${pkgdir}/usr/lib/systemd/user/meow.service
}
