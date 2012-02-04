# Contributor: WAntilles <wantilles@adslgr.com>

pkgname=thunderbird-branded
realname=thunderbird
lightningID="{e2fda1a4-762b-4020-b5ad-a41df1933103}"
pkgver=3.1.11
thundermajorver=3.1
pkgrel=1
pkgdesc="Standalone Mail/News reader"
arch=('i686' 'x86_64')
license=('MPL' 'GPL')
url="http://www.mozilla.org/projects/thunderbird"
replaces=('mozilla-thunderbird')
conflicts=('mozilla-thunderbird' 'thunderbird' 'thunderbird3' 'thunderbird-rc' 'thunderbird-beta')
provides=("mozilla-thunderbird=${pkgver}" "thunderbird=${pkgver}")
depends=('gtk2>=2.22.1' 'gcc-libs>=4.5' 'mozilla-common' 'nss>=3.12.8' 'libxt'
	 'shared-mime-info' 'alsa-lib>=1.0.23' 'dbus-glib>=0.92' 'hunspell'
	 'sqlite3>=3.7.4' 'libcanberra' 'desktop-file-utils')
makedepends=('zip' 'pkg-config' 'libgnomeui' 'python2' 'libidl2' 'wireless_tools'
	     'autoconf2.13' 'imagemagick>=6.6.4.10')
install=thunderbird.install
source=(ftp://ftp.mozilla.org/pub/mozilla.org/thunderbird/releases/${pkgver}/source/thunderbird-${pkgver}.source.tar.bz2
        mozconfig
        thunderbird.desktop
        thunderbird-3.0-lang.patch
        thunderbird-appversion.patch
        thunderbird-shared-error.patch
        xulrunner-png14.patch
        python2.7.patch
        gcc46.patch)
md5sums=('25833b3f90925d96285630d22c85cd5c'
         'f38264fcf3853935a9786b82b8905851'
         'af3e5b344d2edf1c7d61bb0a5a96de9a'
         '25b6fe16ac24cd5c852213e5c1adb272'
         '48ffcdb877a69d383b7d354e330f7658'
         '3dca714ee8054634e6dfdb059464dc42'
         '989b15f6bc9e2e9233fe4c6b23f412b1'
         '78a4d0c920cbb8ec6a9a36974cd775ef'
         'a2bced1791fb8eca978d31b129f92a28')

build() {
  cd "${srcdir}/comm-1.9.2"
  patch -Np1 -i "${srcdir}/thunderbird-3.0-lang.patch"
  patch -Np1 -i "${srcdir}/thunderbird-appversion.patch"
  patch -Np1 -i "${srcdir}/thunderbird-shared-error.patch"
  patch -Np1 -i "${srcdir}/gcc46.patch"
  patch -Np0 -i "${srcdir}/xulrunner-png14.patch"
  patch -Np0 -i "${srcdir}/python2.7.patch"

  cp "${srcdir}/mozconfig" .mozconfig

  echo "ac_cv_visibility_pragma=no" >> .mozconfig

  export MOZ_PROJECT=mail
  unset CXXFLAGS
  unset CFLAGS

  export CXXFLAGS="-fpermissive"
  export LDFLAGS="-Wl,-rpath,/usr/lib/thunderbird-3.1"

  make -f client.mk build MOZ_MAKE_FLAGS="${MAKEFLAGS}"
}

package() {
  cd "${srcdir}/comm-1.9.2"

  make -j1 DESTDIR="${pkgdir}" install

  #Remove included dictionaries, add symlink to system myspell path.
  #Note: this will cause file conflicts when users have installed dictionaries in the old location
  rm -rf "${pkgdir}/usr/lib/$realname-$thundermajorver/dictionaries"
  ln -sf /usr/share/myspell/dicts "${pkgdir}/usr/lib/$realname-$thundermajorver/dictionaries"

  rm -rf "${pkgdir}/usr/bin/defaults"

  install -m755 -d "${pkgdir}/usr/share/applications"
  install -m755 -d "${pkgdir}/usr/share/pixmaps"

  install -m644 "${srcdir}/comm-1.9.2/other-licenses/branding/thunderbird/mailicon48.png" \
  	"${pkgdir}/usr/share/pixmaps/thunderbird.png"

  install -m644 "${srcdir}/thunderbird.desktop" \
      "${pkgdir}/usr/share/applications/"

  rm -f ${pkgdir}/usr/lib/pkgconfig/thunderbird-ns{s,pr}.pc

  #Install lightning manually as for some reason it does not get installed
  mkdir -p ${pkgdir}/usr/lib/$realname-$thundermajorver/extensions/$lightningID
  cd ${pkgdir}/usr/lib/$realname-$thundermajorver/extensions/$lightningID
  bsdtar -x -f ${srcdir}/comm-1.9.2/mozilla/dist/xpi-stage/lightning.xpi

  # Fix permissions
  find -type d -exec chmod 0755 \{\} \+
  find -type f -exec chmod 0644 \{\} \+
  find -name '*.so' -exec chmod 0755 \{\} \+
}

