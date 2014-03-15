# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Michael Eckert <michael.eckert@linuxmail.org>

pkgname=deltarpm-git
pkgver=3.6.r1.b4ff9f2
pkgrel=1
pkgdesc='Package for deltarpms'
arch=('i686' 'x86_64')
license=('BSD')
url='http://gitorious.org/deltarpm/deltarpm'
depends=('python-lxml' 'python2-lxml' 'rpm-org' 'yum')
source=('git+git://gitorious.org/deltarpm/deltarpm.git')
md5sums=('SKIP')

pkgver()
{
    cd "$srcdir"/${pkgname/-git/}
    printf "%s" "$(git describe --tags | sed 's/-/.r/; s/-g/./')"
}

prepare()
{
    cd "$srcdir"/${pkgname/-git/}
    sed -i 's|PYTHONS = python|PYTHONS = python2|g' Makefile
}

build() {
    cd "$srcdir"/${pkgname/-git/}
    make all python
}

package() {
    cd "$srcdir"/${pkgname/-git/}

    make DESTDIR="${pkgdir}" prefix="/usr" mandir="/usr/share/man" install

    install -D -m644 LICENSE.BSD \
        "${pkgdir}/usr/share/licenses/deltarpm-git/LICENSE.BSD"
}
