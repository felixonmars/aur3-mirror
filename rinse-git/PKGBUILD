pkgname=rinse-git
pkgver=
pkgrel=2
pkgdesc="Rinse is a simple tool which is designed to carry out the installation of a new RPM-based distribution."
arch=('i686' 'x86_64')
url="http://collab-maint.alioth.debian.org/rinse/"
groups=()
depends=()
makedepends=('git' 'cpio' 'dpkg' 'rpm-org' 'wget' 'perl' 'perl-libwww' 'perl-html-parser' 'perl-uri')
optdepends=()
license='GPL, PerlArtistic'
provides=('rinse')
conflicts=('rinse')
source=($pkgname::git://git.debian.org/git/collab-maint/rinse.git)
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname" && git fetch --tags
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    git -C "$srcdir/$pkgname" checkout $(git describe --tags $(git rev-list --tags --max-count=1))
}

package() {
    make -C"$srcdir/$pkgname" DESTDIR="$pkgdir/" install
}
