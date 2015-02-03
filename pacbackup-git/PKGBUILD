# Maintainer: Adrien Bak <adrien.bak+aur@gmail.com>
pkgname=pacbackup-git
_pkgname=pacbackup
pkgver=1.0.3
pkgrel=1
pkgdesc="Backs up the list of all explicitly installed packaged and provides restoration script"
arch=('any')
url="http://www.abak.io/pacbackup"
license=('BSD')
groups=()
depends=('python>=3.4' 'git>=2.1.0' 'pyalpm>=0.6.2' 'python-pygit2>=0.21')
makedepends=('git')
conflicts=('pacbackup')
replaces=()
backup=()
options=(!emptydirs)
install=
source=('git://github.com/abak/pacbackup.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}


build() {
    cd "$srcdir/$_pkgname"

    python3 setup.py build
}

package() {
    cd "$srcdir/$_pkgname"

    python3 setup.py install --root=${pkgdir} --optimize=1
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/$_pkgname"

}
