# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: b4283

_pkgname=cdtemp
pkgname=cdtemp-hg
pkgver=r7.8fe2e6cc5991
pkgrel=1
pkgdesc="A simple and convenient temporary working directory manager."
arch=('any')
url="http://bitbucket.org/b4283/cdtemp/"
license=('GPLv3')
makedepends=(mercurial)
source=(hg+https://bitbucket.org/b4283/$_pkgname)
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
    cd $_pkgname
    make
}

package() {
    cd $_pkgname

    mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/etc/profile.d"
    install -m755 cdtemp "${pkgdir}/usr/bin/"
    install -m755 cdtemp.sh "${pkgdir}/etc/profile.d/"
}
