# Contributor: linuxSEAT <--put_my_name_here--@gmail.com>

pkgname=pop
pkgver=2.2
pkgrel=1
pkgdesc="Publish or Perish; a tool to retrieve and analyze academic citations"
arch=('i686')
url="http://www.harzing.com/pop.htm"
license=('custom')
makedepends=('')
depends=('gtk2' 'curl')
source=(http://www.harzing.com/download/${pkgname}-linux.tgz
        pop.png 
    	pop.desktop
        LICENSE)
md5sums=('d817ce327f647f1559b20d5cde60765a' 
	     '9481b0261e9483110723fffce56f71cf'
	     'a8203855230990e4f9e2c2707c681d0a'
         '9e7d662817a238b7f97cb9fb552263da')

build() {

  install -Dm755 ${srcdir}/pop2 ${pkgdir}/usr/bin/pop2

  install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 ${srcdir}/${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}

