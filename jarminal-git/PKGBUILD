# Contributor: wenLiangcan
# Contributor: Jan Rüegg <rggjan@gmail.com>

pkgname=jarminal-git
pkgver=20090626
pkgrel=1
pkgdesc="Jarminal (Terminal -Te +Ja) is a java interactive shell. "
arch=('x86_64' 'x86')
url="http://gitorious.org/jarminal"
license=('GPL3')
depends=('python2' 'java-runtime' 'elinks')
makedepends=('git')
source=("${pkgname}"::"git://gitorious.org/jarminal/mainline.git")
md5sums=('SKIP')
backup=('etc/jarminal.conf')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
    cd ${pkgname}
    sed -i 's/python/python2/' 'src/jarminal_read'
    make || return 1
}

package() {
    cd ${pkgname}
    make DESTDIR="${pkgdir}/" install
    install -Dm644 "${pkgdir}/usr/local/man/man1/jarminal.1" "${pkgdir}/usr/share/man/man1/jarminal.1.gz"
    rm -rf "${pkgdir}/usr/local"
}
