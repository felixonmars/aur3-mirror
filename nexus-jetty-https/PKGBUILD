# Maintainer: Damian Nowak <damian.nowak@atlashost.eu>

pkgname='nexus-jetty-https'
pkgdesc='Hack Jetty to work on HTTP behind a HTTPS proxy - built for Nexus 2.x'
pkgver='1'
pkgrel='1'
epoch=
arch=('i686' 'x86_64')
url='https://bitbucket.org/Nowaker/jetty-https'
license=('Apache')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=('nexus' 'nexus2')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="$pkgname.install"
changelog=
_jar='jetty-https-1.jar'
source=("https://bitbucket.org/Nowaker/jetty-https/downloads/${_jar}")
noextract=("${_jar}")
md5sums=('874c02a018fb23a9b360aefa12f4d641')
PKGEXT='.tar.gz'

build() {
  cd "$pkgdir"
  install -Dm644 "$srcdir/${_jar}" "$pkgdir/opt/nexus/lib/${_jar}"
}
