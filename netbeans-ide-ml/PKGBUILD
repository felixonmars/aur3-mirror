# Maintainer : Benjamin Arnoult <benjamin.arnoult@yahoo.fr>
# Contributor :  Sławomir Kowalski <suawekk@gmail.com>
# This PKGBUILD is based on AUR package : netbeans-ml.
# I made some corrections especially for i686 version 
# and added an icon in PNG format

pkgname=netbeans-ide-ml
pkgver=7.1.1
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
source=('http://bits.netbeans.org/7.1.1/community/2012-03-09_13-44-28/zip/netbeans-7.1.1-201203091344-ml.zip'
        'netbeans.desktop' 'netbeans.png')
md5sums=('b3436f574045148b678597b5a63e2007'
         '31478ebca553043d1f523e9253cd1bcc'
	 '920d3f9b6f644d63ab87610d9ec943bd')

build() {
  # cleanup OS specific files
  rm $(find -name '*\.exe' -or -name '*\.bat')
  rm -r $(find -name 'MacOSX*' -or -name 'Windows*' -or -name 'SunOS*')
  rm -r $(find -name 'hpux*' -or -name 'mac*' -or -name 'solaris*' -or -name 'windows*')
  # Remove 64 bits files on an i686 system else stripping fails
  if [ `uname -m` = 'i686' ]; then
  	rm -rf $(find -name '*64*')
	rm -rf $(find -name '*x64*')
	rm -rf $(find -name 'Linux-x86_64')
  fi
}

package() {
  install -d ${pkgdir}/usr/share
  cp -r netbeans ${pkgdir}/usr/share

  install -d ${pkgdir}/usr/share/applications
  install -m644 netbeans.desktop \
    ${pkgdir}/usr/share/applications

  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/netbeans/bin/netbeans ${pkgdir}/usr/bin/netbeans
  
  install -d ${pkgdir}/usr/share/pixmaps
  install -m644 netbeans.png \
    ${pkgdir}/usr/share/pixmaps
}

