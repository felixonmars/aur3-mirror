# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Balló György <ballogyor+arch@gmail.com>

pkgname=indicator-session-systemd
_basename=indicator-session
pkgver=12.10.4
pkgrel=6
pkgdesc='Indicator showing session management, status and user switching (using systemd and polkit)'
arch=('i686' 'x86_64')
url="https://launchpad.net/${_basename}"
license=('GPL')
provides=('indicator-session')
conflicts=('indicator-session')
depends=('dconf' 'libdbusmenu-gtk3' 'libindicator-gtk3' 'systemd' 'dbus')
makedepends=('intltool')
install="${_basename}.install"
source=("${url}/${pkgver%.*}/${pkgver}/+download/${_basename}-${pkgver}.tar.gz"
        "http://pkgbuild.com/~bgyorgy/sources/${_basename}-translations-20130310.tar.gz"
        'remove-unused-deps.patch'
        'gdbus-port.patch'
        'fix-build.patch'
        'fix-fallback-icon.patch'
        'support-reboot.patch'
        'systemd-support.patch'
        'lets_put_a_stop_to_this_silliness.patch'
        'systemd-dbus-session-manager')
sha512sums=('06269af75271cd69d4385e6d0f095cf52033c0449002c26b25d34e507f70d1b8ecdc248d0b9a16c8f5cdfea51abb024faa4d03cf65adc359b966be6670c9254b'
            '663cb78ba8b40b7785042e7ac4725e29882f4a2a75416d240841aa13bd2174596b1ca12b28e95903f1c93aae7a1db017fb6233426aaae5597ee8d4f318a06d06'
            '1605ae8d6079023e186a5edc8fdb8f6528e9b727e9dd05d276d9f1377f651dc8e6e08aaa4bf572428db3a502f34cb5dc235593a34a718723c90f6ada30227ff7'
            'c85c870c73bec66c8c7c1616a7a17da29a984c8667154cd060085c80029a7f3263638991d33e87438db51af12e137cbc2419b40b9e0f2b4163d7f4b5e097dc0b'
            'da6c0a3680fcadcab2dda65489b34f99c483b6ece2c90cc72a4d57c6d5db0c69d9d96c56c6f6dd3b02fc1bc1fc96172652f839d705f8053491222ae0ca71b346'
            'e46636d08c846339a101d32d1324d0e303a413ad64d57f254c9ebef1d7c21d6abc7eda8285f15c35d87fb793c1a32037279c25f8c4293f1aefeea217b07a69a5'
            'c269aa906f65824fec9a1df0de650222a42d9eb5766a8b5d5dcf13db2fa9b65cce69af266b969a3d1cb39a506082d3d841909e4008691ec64584a16be8b3826e'
            '7cb69f346dfe8873aa268af0a73461c252e35f0296724400c574bc3dcc93c63ec8711b528145db0993af4c73906b0d4f07442d11cfb4644fe59936f4ee91af2d'
            '6a1c5150776ed0a9791e323e9d0776b6690c4f09b9488e9759c0eb101858f1923a3c2b8049930a1286d95caca19551c14b50ffe9ee3b225e4688fe2d214a0444'
            '5a663219ba4525267df0482cd53d5dd697fb826b105db1649aefe0ed5b517d0ff38fdee01b4cec1fa395c530d18b5345a47363e976ac4c92daaa816ada90d95e')

prepare() {

  cd ${_basename}-${pkgver}

  patch -Np0 -i ../remove-unused-deps.patch
  patch -Np0 -i ../gdbus-port.patch
  patch -Np1 -i ../fix-build.patch
  patch -Np0 -i ../fix-fallback-icon.patch
  patch -Np1 -i ../support-reboot.patch
  patch -Np0 -i ../systemd-support.patch
  patch -Np1 -i ../lets_put_a_stop_to_this_silliness.patch
  sed -i 's/gnome-control-center credentials/credentials-preferences/' src/online-accounts-mgr.c
  sed -i 's/Ubuntu Help/Desktop Help/' src/session-menu-mgr.c

# Install updated language files
  rename ${_basename}- '' ../po/${_basename}-*.po
  mv -f -t po ../po/*
  printf "%s\n" po/*.po | sed -e 's/po\///g' -e 's/\.po//g' >po/LINGUAS
}

build() {
  cd ${_basename}-${pkgver}

  export CFLAGS="$CFLAGS -Wno-deprecated-declarations"
  autoreconf -fi
  ./configure --prefix='/usr' --sysconfdir='/etc' --localstatedir='/var' --libexecdir="/usr/lib/${_basename}" --disable-{gtklogouthelper,schemas-compile,static}
  make
}

package() {
  cd ${_basename}-${pkgver}

  make DESTDIR="${pkgdir}" install

  # Don't install session-manager script if user has a personalized copy
  if [ ! -f "/usr/local/sbin/systemd-dbus-session-manager" ]; then
    install -Dd "${pkgdir}/usr/bin/"
    install -Dm755 "${srcdir}/systemd-dbus-session-manager" "${pkgdir}/usr/bin/"
  fi

# Remove guest session
  rm -r "${pkgdir}"/usr/share/indicators
}
