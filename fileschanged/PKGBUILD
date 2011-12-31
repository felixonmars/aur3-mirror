# Maintainer: Joseph Graham (Greatest person ever) <joe at t67 dot eu>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=fileschanged
pkgver=0.6.9
pkgrel=3
pkgdesc="A command-line utility that reports when files have been altered. "
arch=('i686' 'x86_64' 'mips64el')
url="http://www.nongnu.org/fileschanged/"
license=('GPL')
depends=('fam')
makedepends=('moreutils')
options=('!emptydirs')
source=(http://nongnu.askapache.com/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('d2e6141196ac28be558011a3fe3e5555') 

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # -Werror flags are breaking the build so I remove them.
  for line in $( grep -Rl Werror * )
  do
      sed 's/-Werror//g' "${line}" | sponge "${line}"
  done
  
  ./configure --prefix=/usr
  make 
  make prefix=/usr bindir=${pkgdir}/usr/bin infodir=${pkgdir}/usr/share/info/${pkgname} mandir=${pkgdir}/usr/share/man datarootdir=${pkgdir}=/usr/share/${pkgname} install
}
