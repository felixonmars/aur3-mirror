# Mantainer :  Sławomir Kowalski <suawekk@gmail.com>
# This PKGBUILD is based on AUR package : netbeans-de

pkgname=netbeans-ml
pkgver=7.0.1
pkgrel=1
pkgdesc='Netbeans IDE development platform. Multilanguage version'
arch=('any')
url='http://www.netbeans.org'
license=('CDDL/GPL')
provides=('netbeans')
conflicts=('netbeans')
depends=('java-environment')
optdepends=('php: for developing programs in PHP'
            'python: for developing programs in Python'
            'ruby: for developing programs in Ruby')
install='netbeans.install'
#options=('!strip')
source=('http://bits.netbeans.org/7.0.1/community/latest/zip/netbeans-7.0.1-201111061500-ml.zip'
        'netbeans.desktop')
md5sums=('11f1f4f76e15a2cc19e64f7a12b6279a'
         '100bab2f685f3613bdee7f90dd07f014')

build() {
  # cleanup OS specific files
  rm $(find -name '*\.exe' -or -name '*\.bat')
  rm -r $(find -name 'MacOSX*' -or -name 'Windows*' -or -name 'SunOS*')
  rm -r $(find -name 'hpux*' -or -name 'mac*' -or -name 'solaris*' -or -name 'windows*')
}

package() {
  install -d ${pkgdir}/usr/share
  cp -r netbeans ${pkgdir}/usr/share

  install -d ${pkgdir}/usr/share/applications
  install -m644 netbeans.desktop \
    ${pkgdir}/usr/share/applications

  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/netbeans/bin/netbeans ${pkgdir}/usr/bin/netbeans
}

