# Contributor: Marco Süß <m_a_r_c_o.suess at gmx.de>

pkgname=lib32-fst-git
pkgver=20091102
pkgrel=1
pkgdesc="FreeST: Standalone wrapper for Windows VST plug-ins"
arch=(x86_64)
url="http://www.joebutton.co.uk/fst/"
license=('GPL')
depends=('lib32-lash' 'bin32-wine')
makedepends=()
provides=('fst')
conflicts=('fst')
install=$pkgname.install
source=(http://repos.archaudio.org/testing/i686/${pkgname/lib32-/}-${pkgver}-${pkgrel}-i686.pkg.tar.gz)
md5sums=(ebf827123f1bce493d667fa7f36f3978)

build() {
    install -dm755 $pkgdir/opt/lib32 || return 1
    cp -R $srcdir/usr $pkgdir/opt/lib32 || return 1
}
