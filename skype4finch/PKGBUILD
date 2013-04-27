# Maintainer : shad0w73 <shad0w73@freenet.de>
# Contributor: Sébastien Leduc <sebastien@sleduc.fr>
# Contributor: Laszlo Papp <djszapi @ archlinux d_o_t us>

pkgname=skype4finch
pkgver=20130113
pkgrel=3
pkgdesc="Skype plugin for Finch"
arch=('i686' 'x86_64')
url="https://code.google.com/p/skype4pidgin/"
license=('GPL3')
depends=('finch' 'skype')
conflicts=('skype4pidgin-svn-dbus')
replaces=('skype4pidgin-svn-dbus')

if [[ $CARCH == 'i686' ]]; then
  source=(https://skype4pidgin.googlecode.com/svn/downloads/libskype_dbus.so)
  md5sums=('9554636b5a46b3e907f97066a7e31135')
elif [[ $CARCH == 'x86_64' ]]; then
  source=(https://skype4pidgin.googlecode.com/svn/downloads/libskype_dbus64.so)
  md5sums=('c957d9b864d4b0b187d6067ec1199ebb')
fi


package() {
  cd "${srcdir}"
  if [[ $CARCH == 'i686' ]]; then
    install -D -m 0755 libskype_dbus.so ${pkgdir}/usr/lib/purple-2/libskype_dbus.so
  elif [[ $CARCH == 'x86_64' ]]; then
    install -D -m 0755 libskype_dbus64.so ${pkgdir}/usr/lib/purple-2/libskype_dbus64.so
  fi
}
