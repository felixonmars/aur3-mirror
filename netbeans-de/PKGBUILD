# Maintainer:  Testuser_01 <arch@nico-siebler.de>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Timm Preetz <timm@preetz.us>

pkgname=netbeans-de
_pkgname=netbeans
pkgver=7.3
_pkgdate=201302261559
pkgrel=1
pkgdesc='Netbeans IDE development platform. German version / NetBeans Entwicklungsumgebung. Deutsche Version'
arch=('any')
url='http://www.netbeans.org'
license=('CDDL/GPL')
provides=('netbeans')
conflicts=('netbeans')
depends=('java-environment')
optdepends=('php: for developing programs in php'
            'python: for developing programs in python')
install='netbeans.install'
source=(
	"http://bits.netbeans.org/netbeans/${pkgver}/community/latest/zip/${_pkgname}-${pkgver}-${_pkgdate}.zip"
        'netbeans.desktop')
md5sums=('72e09977be6eef88fac5c2fe896c5f1c'
         '100bab2f685f3613bdee7f90dd07f014')
sha512sums=('64f1b76886027ac3be63e46ec5f2065546a5f567dfea00bb7110a6420f7a58e80662cfd93b8514ec56bc52af526ebf67fa5e8dc71274d7bebaba90509ef69219'
            '1566bb07f209da34c1ad4f35b1441408bfe35f57dc840108bdcf6c9f5ff51a738b5317458e556c6941c6535335aa251c8246752827ffd1bf15b4f1d4523195c6')

build() {
  # cleanup OS specific files
  find -depth -regextype posix-extended -iregex '.*\.(exe|bat)$' -delete
  rm -r $(find -name 'MacOSX*' -or -name 'Windows*' -or -name 'SunOS*')
  rm -r $(find -name 'hpux*' -or -name 'mac*' -or -name 'solaris*' -or -name 'windows*')
}

package() {
  install -d "${pkgdir}/usr/share" || return 1
  chmod 755 -R "netbeans" || return 1
  cp -r "netbeans" "${pkgdir}/usr/share" || return 1
  install -d "${pkgdir}/usr/share/applications" || return 1
  install -m644 "netbeans.desktop" "${pkgdir}/usr/share/applications" || rteturn 1
  install -d "${pkgdir}/usr/bin" || return 1
  ln -s "/usr/share/netbeans/bin/netbeans" "${pkgdir}/usr/bin/netbeans" || return 1
}

