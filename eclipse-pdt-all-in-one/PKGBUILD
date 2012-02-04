# $Id: PKGBUILD 8114 2008-08-06 14:27:35Z paul $
# Contributor: Andrew Wright <andreww@photism.org>
# Contributor: Andreas W. Hauser <andy-aur@splashground.de>
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Rafael Martins <rafael@rafaelmartins.com>
# Contributor: Andrea Scaripino 'bash' andrea@archlinux.org>
# Maintainer: Jordi Cerdan 'jcerdan' <jcerdan@tecob.com>

pkgname=eclipse-pdt-all-in-one
pkgver=3.0.2
pkgrel=2
pkgdesc="PHP Development Tools framework for the Eclipse platform (included)."
arch=('i686' 'x86_64')
url="http://www.eclipse.org/pdt/"
  #  "${pkgdir}/usr/share/icons/hicolor/32x32/apps/eclipse.png" || return 1
install=eclipse.install
provides=('eclipse=3.7' 'eclipse-pdt=3.0')
depends=('java-environment' 'fontconfig' 'libxrender' 'libxext' 'hicolor-icon-theme')
conflicts=('eclipse-emf' 'eclipse-dltk-core' 'eclipse-dltk-mylyn' 'eclipse-dtp' 'eclipse-gef' 'eclipse-wtp')
license=('EPL')
md5sums=('a64635e2c51f77d74d64d19d8bc831f0'
         'a1666ff79a3c3d48e535d789d4a1b9ff'
	 '69c3ee11eb451d042575150c5b727f45'
	 'ee66a334bc443fd23ad9bc080dc6ea69')
[ ${CARCH} = 'x86_64' ] && md5sums[0]="11127e0023b9a42f0e874b0e497d2f00"

source=('http://zend-sdk.googlecode.com/files/eclipse-php-3.0.2.v2011102768-x86.tar.gz'
        'eclipse.sh'
        'eclipse.desktop'
	'eclipse.ini.patch')
[ ${CARCH} = 'x86_64' ] && source[0]="http://zend-sdk.googlecode.com/files/eclipse-php-3.0.2.v2011102768-x86_64.tar.gz"


build() {
  cd ${srcdir} || return 1
  #patch
  #patch -Np0 -i "${srcdir}/eclipse.ini.patch" || return 1

  # install eclipse
  install -m755 -d "${pkgdir}/usr/share"
  mv "${srcdir}/eclipse-php" "${pkgdir}/usr/share/eclipse" || return 1

  # install misc
  mkdir -p ${pkgdir}/usr/bin ${pkgdir}/usr/share/applications \
    ${pkgdir}/usr/share/icons/hicolor/{16x16,32x32,48x48}/apps || return 1
  install -m755 "${srcdir}/eclipse.sh" "${pkgdir}/usr/bin/eclipse" || return 1
  install -m644 "${srcdir}/eclipse.desktop" "${pkgdir}/usr/share/applications/" || return 1
  #ln -s /usr/share/eclipse/plugins/org.eclipse.sdk_${_internal_pkgver}.v${_date}/eclipse.png \
  #  "${pkgdir}/usr/share/icons/hicolor/16x16/apps/eclipse.png" || return 1
  #ln -s /usr/share/eclipse/plugins/org.eclipse.sdk_${_internal_pkgver}.v${_date}/eclipse32.png \
  #  "${pkgdir}/usr/share/icons/hicolor/32x32/apps/eclipse.png" || return 1
  #ln -s /usr/share/eclipse/plugins/org.eclipse.sdk_${_internal_pkgver}.v${_date}/eclipse48.png \
  #  "${pkgdir}/usr/share/icons/hicolor/48x48/apps/eclipse.png" || return 1


  # install icon
  #install -D -m644 $startdir/src/eclipse-icon-clean.svg $startdir/pkg/usr/share/icons/hicolor/scalable/apps/eclipse.svg || return 1
}
