# Contributor : André Silva <emulatorman@parabola.nu>
# Contributor : Márcio Silva <coadde@parabola.nu>
#
# This package is ported from Parabola GNU Linux community
# Maintainer at AUR : Taro Konda

# We're getting this from Debian Sid
_debname=icedove
_debver=24.3.0
_debrel=deb1
_debrepo=http://ftp.debian.org/debian/pool/main/
debfile() { echo $@|sed -r 's@(.).*@\1/&/&@'; }

_pkgname=${_debname}
pkgname=${_debname}-libre-nonprism
epoch=1
pkgver=${_debver}.${_debrel}
pkgrel=1
pkgdesc="A libre version of Debian Icedove, the standalone mail/news reader based on Mozilla Thunderbird, without support for unsafe and dangerous for privacy protocols"
arch=('i686' 'x86_64' 'mips64el')
license=('MPL' 'GPL' 'LGPL')
url="http://packages.debian.org/sid/${_pkgname}"
depends=('alsa-lib' 'dbus-glib' 'desktop-file-utils' 'gtk2' 'hicolor-icon-theme' 'hunspell' 'libevent' 'libvpx' 'libxt' 'mime-types' 'mozilla-common' 'mozilla-searchplugins' 'nss' 'sqlite' 'startup-notification')
makedepends=('unzip' 'zip' 'pkg-config' 'python2' 'wireless_tools' 'yasm' 'mesa' 'autoconf2.13' 'quilt' 'jquery-ui')
optdepends=('libcanberra: for sound support')
replaces=('thunderbird' "${pkgname%-nonprism}")
conflicts=('thunderbird' "${pkgname%-nonprism}")
provides=('thunderbird' "${pkgname%-nonprism}=$epoch:$pkgver")
install=${_pkgname}.install
source=("${_debrepo}/`debfile ${_debname}`_${_debver}.orig.tar.xz"
        "${_debrepo}/`debfile ${_debname}`_${_debver}-${_debrel#deb}.debian.tar.xz"
        mozconfig
        vendor.js
        ${_pkgname}.desktop)
options=(!emptydirs)
md5sums=('cbf58e11a8eb1ded01167fa927ce9cc0'
         'a8ef513d211c60bd2e77810c10a3c25c'
         'c46cf2a671c8fdefcabd4c87e38f3d40'
         '5a53179d14ae9631b7afe5e4d0fc0b25'
         'e785e0c267f4435ae1a9aa0b03bcacfb')

prepare() {
  export DEBIAN_BUILD="comm-esr24"

  export QUILT_PATCHES=debian/patches
  export QUILT_REFRESH_ARGS='-p ab --no-timestamps --no-index'
  export QUILT_DIFF_ARGS='--no-timestamps'

  mv debian "${srcdir}/${DEBIAN_BUILD}"
  cd "${srcdir}/${DEBIAN_BUILD}"

  mv debian/${_pkgname}-branding "${srcdir}/${DEBIAN_BUILD}/mail/branding/${_pkgname}"

  cp -a debian/app-icons/${_pkgname}big.svg debian/app-icons/${_pkgname}_icon.svg
  for i in 16x16 22x22 24x24 32x32 48x48 256x256; do
      install -Dm644 "debian/app-icons/${_pkgname}${i/x*/}.png" "${srcdir}/${DEBIAN_BUILD}/mail/branding/${_pkgname}/mailicon${i/x*/}.png"
  done
  for i in 48x48 64x64; do
      install -Dm644 "debian/app-icons/${_pkgname}${i/x*/}.png" "${srcdir}/${DEBIAN_BUILD}/mail/branding/${_pkgname}/content/icon${i/x*/}.png"
  done

  # Fix orthographic issue ("Icdove" to "Icedove") in MOZ_APP_BASENAME line for confvars.sh.
  sed -i 's|Icdove|Icedove|' debian/patches/debian-hacks/Icedove-branding.patch

  quilt push -av

  # Fix paths on makefile
  sed -i 's|topsrcdir = [.][.]/[.][.]/[.][.]/|topsrcdir = @top_srcdir@|;
          s|include $(topsrcdir)/config/autoconf.mk|include $(DEPTH)/config/autoconf.mk|;
          s|include $(DEPTH)/config/rules.mk|include $(topsrcdir)/config/rules.mk|;
         ' mail/branding/icedove/Makefile.in

  sed -i 's|topsrcdir      = [.][.]/[.][.]/[.][.]/[.][.]|topsrcdir      = @top_srcdir@|;
          s|include $(topsrcdir)/config/autoconf.mk|include $(DEPTH)/config/autoconf.mk|;
          s|include $(DEPTH)/config/rules.mk|include $(topsrcdir)/config/rules.mk|;
         ' mail/branding/icedove/locales/Makefile.in

  # Fix package-manifest.in
  sed -i '\|; Phishing Protection| s|$|\n#ifdef MOZ_SAFE_BROWSING|;
          \|@BINPATH@/components/url-classifier[.]xpt| s|$|\n#endif|
         ' mail/installer/package-manifest.in

  # Fix branding
  sed -i 's|Icedove Mail/News|Icedove|' mail/branding/icedove/locales/en-US/brand.{dtd,properties}

  # Replace common URLs
  sed -i '\|extensions[.]getAddons[.]get[.]url| s|https://services[.]addons[.]mozilla[.]org.\+["][)][;]|http://directory.fsf.org/wiki/Icedove");|g;
          \|extensions[.]getAddons[.]search[.]browseURL| s|https://addons[.]mozilla[.]org.\+["][)][;]|http://directory.fsf.org/wiki/Icedove");|g;
          \|extensions[.]getAddons[.]search[.]url| s|https://services[.]addons[.]mozilla[.]org.\+["][)][;]|http://directory.fsf.org/wiki/Icedove");|g;
          \|extensions[.]webservice[.]discoverURL| s|https://services[.]addons[.]mozilla[.]org.\+["][)][;]|http://directory.fsf.org/wiki/Icedove");|g;
         ' mail/app/profile/all-thunderbird.js

  # Remove support for unsafe and dangerous for privacy protocols
  sed -i '\|facebook|d
          \|gtalk|d
          \|twitter|d
         ' chat/moz.build
  sed -i '\|facebook[.]js|d
          \|facebook[.]manifest|d
          \|gtalk[.]js|d
          \|gtalk[.]manifest|d
          \|twitter[.]js|d
          \|twitter[.]manifest|d
         ' mail/installer/package-manifest.in
  rm -r chat/protocols/{facebook,gtalk,twitter}

  cp "${srcdir}/mozconfig" .mozconfig

  # configure script misdetects the preprocessor without an optimization level
  # https://bugs.archlinux.org/task/34644
  sed -i '/ac_cpp=/s/$CPPFLAGS/& -O2/' mozilla/configure

  # Add symlinks to use jquery files built for us
  ln -s /usr/share/javascript/jquery/jquery.min.js mail/jquery
  ln -s /usr/share/javascript/jquery-ui/jquery-ui.min.js mail/jquery
}

build() {
  export DEBIAN_BUILD="comm-esr24"

  cd "${srcdir}/${DEBIAN_BUILD}"

  export LDFLAGS="${LDFLAGS} -Wl,-rpath,/usr/lib/${_pkgname}"
  export PYTHON="/usr/bin/python2"

  make -j1 -f client.mk build MOZ_MAKE_FLAGS="${MAKEFLAGS}"
}

package() {
  export DEBIAN_BUILD="comm-esr24"

  cd "${srcdir}/${DEBIAN_BUILD}"

  make -j1 -f client.mk DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/vendor.js" "${pkgdir}/usr/lib/${_pkgname}/defaults/preferences/vendor.js"

  for i in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
      install -Dm644 "debian/app-icons/${_pkgname}${i/x*/}.png" "${pkgdir}/usr/share/icons/hicolor/$i/apps/${_pkgname}.png"
  done
  install -Dm644 "debian/app-icons/${_pkgname}_icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
  
  install -Dm644 "${srcdir}/${_pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  
  rm -rf "${pkgdir}"/usr/lib/${_pkgname}/{dictionaries,hyphenation,searchplugins}
  ln -sf /usr/share/hunspell "${pkgdir}/usr/lib/${_pkgname}/dictionaries"
  ln -sf /usr/share/hyphen "${pkgdir}/usr/lib/${_pkgname}/hyphenation"
  ln -sf /usr/lib/mozilla/searchplugins "${pkgdir}/usr/lib/${_pkgname}/searchplugins"

  # We don't want the development stuff
  rm -r "${pkgdir}"/usr/{include,lib/${_pkgname}-devel,share/idl}
}
