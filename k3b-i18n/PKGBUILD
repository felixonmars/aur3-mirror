# Contributor: _AND_ <and@ebrilo.jp>
license=('unknown')
arch=('i686' 'x86_64')
pkgname=k3b-i18n
pkgver=1.70.0beta1
pkgrel=10
pkgdesc="Language packs for k3b"
url=http://k3b.org
depends=('k3b=1.70.0beta1')
makedepends=('rpmextract')
source=(http://download.opensuse.org/repositories/KDE:/KDE4:/UNSTABLE:/Desktop/openSUSE_Factory/noarch/k3b-lang-1.70.0-18.13.noarch.rpm)
md5sums=('b4d7ebfcebe9d193d63253781ef9fd1d')

build() {
cd "${pkgdir}"
rpmextract.sh "../k3b-lang-1.70.0-18.13.noarch.rpm"
}
