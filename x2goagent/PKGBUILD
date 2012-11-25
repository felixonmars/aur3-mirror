# Maintainer: Milan Knížek <knizek@volny.cz>
pkgname=x2goagent
pkgver=3.5.0.15
pkgrel=1
pkgdesc="X proxy server for x2go using NX libs"
arch=(any)
license=('GPL2')
url="http://www.x2go.org/"
depends=('nxagent>=3.5.0') # Pacman does not support searching for 3.5.0.14 - only three levels work.
conflicts=('x2goagent-git')
groups=('x2go' 'alts')
source=(changelog.Debian
        copyright.DEBIAN
        rgb
        x2go.xpm
        x2goagent
        x2goagent.1
        VERSION.x2goagent)

package() {
  cd "$srcdir"

  install -m 755 -D "x2goagent" "${pkgdir}/usr/bin/x2goagent"

  install -m 755 -d "${pkgdir}/usr/lib/x2go"
  ln -s "../nx/nxagent" "${pkgdir}/usr/lib/x2go/x2goagent"

  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 "copyright.DEBIAN" "${pkgdir}/usr/share/doc/${pkgname}/copyright.DEBIAN"
  install -m 644 "changelog.Debian" "${pkgdir}/usr/share/doc/${pkgname}/changelog.Debian"

  install -m 755 -d "${pkgdir}/usr/share/x2go"
  install -m 644 "rgb" "${pkgdir}/usr/share/x2go/rgb"

  install -m 755 -d "${pkgdir}/usr/share/x2go/versions"
  install -m 644 "VERSION.x2goagent" "${pkgdir}/usr/share/x2go/versions/VERSION.x2goagent"

  install -m 755 -d "${pkgdir}/usr/share/pixmaps"
  install -m 644 "x2go.xpm" "${pkgdir}/usr/share/pixmaps/x2go.xpm"

  install -m 755 -d "${pkgdir}/usr/share/man/man1"
  install -m 644 "x2goagent.1" "${pkgdir}/usr/share/man/man1/x2goagent.1"
  gzip -f "${pkgdir}/usr/share/man/man1/x2goagent.1"
}

md5sums=('36fa43cd415d39069114ff053306488b'
         '29004bd2f64cbf26d207f700563134cc'
         '09ee098b83d94c7c046d6b55ebe84ae1'
         'd4aef9537add1e370e50fd2d73ba3ebe'
         '5365e13d56fa0cbb6c03d79abc18e4b9'
         'f5f70d4e0e38aefd5c4e680fcad36e14'
         'a64d193d7a8731255306969a961a1650')
