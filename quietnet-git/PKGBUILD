# Maintainer: Christoph Haag <haagch@studi.informatik.uni-stuttgart.de>
#Very hacky PKGBUILD. Don't judge me. It works

pkgname=quietnet-git
_pkgname=quietnet
pkgver=r40.20377c2
pkgrel=1
pkgdesc="Simple chat program using near ultrasonic frequencies. Works without Wifi or Bluetooth and won't show up in a pcap."
arch=('any')
url="https://github.com/Katee/quietnet"
license=('MIT')
depends=("python2-numpy" "python2-pyaudio")
makedepends=()
provides=()
options=()
source=("git+https://github.com/Katee/quietnet.git"
        "quietnet-send"
        "quietnet-listen")
        
#prepare() {
#}

#build() {
#	cd "$srcdir/$_pkgname"
#}

#check() {
#	cd "$srcdir/$_pkgname"
#	make -k check
#}

package() {
        install -Dm755 quietnet-listen ${pkgdir}/usr/bin/quietnet-listen
        install -Dm755 quietnet-send ${pkgdir}/usr/bin/quietnet-send

	cd "$srcdir/$_pkgname"
        install -Dm655 LICENSE ${pkgdir}/usr/share/licenses/quietnet/LICENSE
        install -d ${pkgdir}/usr/lib/python2.7/site-packages/$_pkgname/
        for i in *.py
        do
                install -m 655 ${i} ${pkgdir}/usr/lib/python2.7/site-packages/${i}
        done
        cp -ra notebooks ${pkgdir}/usr/lib/python2.7/site-packages/
}

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

md5sums=('SKIP'
         '014f798775411ed90984a9db14fab80c'
         'fcd5f956343a6b47389e0ccc01f715ef')
