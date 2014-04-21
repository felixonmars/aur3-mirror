# Maintainer: kalgasnik <pan.pav.7c5@gmail.com>

pkgname=lightdm-another-gtk-greeter
pkgver=1.0.6.3
pkgrel=4
pkgdesc="Yet another GTK+ greeter for LightDM"
arch=('i686'
      'x86_64')
url="https://github.com/kalgasnik/lightdm-another-gtk-greeter"
license=('GPL3')
depends=('lightdm'
         'gtk3'
         'accountsservice')
makedepends=('git'
             'gnome-common'
             'gobject-introspection'
             'intltool')
optdepends=('onboard: On-screen keyboard'
            'lightdm-another-gtk-greeter-themes: additional themes')
backup=('etc/lightdm/lightdm-another-gtk-greeter.conf')
install='lightdm-another-gtk-greeter.install'
source=(https://github.com/kalgasnik/${pkgname}/archive/${pkgver}-${pkgrel}.tar.gz)
md5sums=('7e4255fccd5725be98a5b40a61953130')

build() {
  cd "$srcdir/${pkgname}-${pkgver}-${pkgrel}"

  mkdir build/ && cd build/

  export AUTOMAKE=automake
  ../autogen.sh --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/lightdm \
    --disable-static

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}/build"
  make DESTDIR="${pkgdir}/" install
}
