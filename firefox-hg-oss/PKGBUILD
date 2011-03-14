# Contributor: MutantMonkey <mutantmonkey@gmail.com>
pkgname=firefox-hg-oss
pkgver=63400
pkgrel=1
_ffver="4.0b13pre"
pkgdesc="Standalone web browser from mozilla.org, latest development version, without ALSA"
url="http://www.mozilla.org/projects/firefox/"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2>=2.16.2' 'gcc-libs>=4.4.0' 'libidl2>=0.8.13' 'mozilla-common' 'nss>=3.12.3' 'nspr>=4.8' 'libxt' 'hunspell>=1.2.8' 'startup-notification>=0.10' 'pango>=1.24.0' 'desktop-file-utils' 'cairo-tee' 'libpng>=1.2.24-3' 'libjpeg' 'lcms' 'mesa' 'libproxy')
makedepends=('mercurial' 'zip' 'pkgconfig' 'diffutils' 'imagemagick' 'python2' 'xorg-server' 'autoconf2.13' 'libnotify' 'wireless_tools' 'yasm')
optdepends=('libnotify' 'wireless_tools')
provides=("firefox=${_ffver}" "firefox-hg=${pkgver}")
install=firefox.install
source=(mozconfig
        mozilla-firefox-1.0-lang.patch
        firefox-hg.desktop
        firefox-hg-safe.desktop
        firefox.sh)
md5sums=('3642cba829a3ecaa9e74a1493da79cb7'
         'bd5db57c23c72a02a489592644f18995'
         '4022581eb05405b82c489d5ea16b1a17'
         '9271601e9b9837c8f3fc3a35367ea3aa'
         '9f89ce44e4202783779c4bc33f10c176')
sha256sums=('e0144e029766aeb7cda8915c637c8617cba4e1039d0ec6e925b3a4d8d7ea996d'
            '0ca095ff2af57297f615877a7e79ddc84d1a3f62509a8af6ca50aad7a8671f6a'
            '5e805fd15d9937ed219afbf3e30c7d39dd613733f6e60d011e6087f765765d10'
            'e6d3f3ba8b8c3340de1f2456e6812084a379c521bb01965b34f9559b59a6f05a'
            '5e2cbdf36bb021504e2e8fd8400637301237f12d62820a9d0359ee5e68591609')

_hgroot="http://hg.mozilla.org"
_hgrepo=mozilla-central

build() {
  cd ${srcdir}/mozilla-central
  cp ${srcdir}/mozconfig .mozconfig
 
  # Use OSS instead of ALSA.
  sed -i 's/sydney_audio_alsa/sydney_audio_oss/' media/libsydneyaudio/src/Makefile.in || return 1

  # Get rid of ALSA stuff in the build system.
  sed -i '/alsa\//d' config/system-headers || return 1
  sed -i '/alsa\//d' js/src/config/system-headers || return 1
  sed -i '/LIB(asound/d' configure.in || return 1
  autoconf-2.13 || return 1

  # update firefox.sh launcher with proper Firefox version
  sed -i "s/firefox-hg/firefox-${_ffver}/g" ${srcdir}/firefox.sh
  
  msg "Patching..."

  # Use LANG environment variable to choose locale (from firefox)
  patch -Np1 -i "$srcdir"/mozilla-firefox-1.0-lang.patch

  unset CXXFLAGS
  export LDFLAGS="-Wl,-rpath,/usr/lib/firefox-${_ffver}"
  
  #make -j1 -f client.mk MOZ_MAKE_FLAGS="${MAKEFLAGS}"
}

package() {
  cd ${srcdir}/mozilla-central

  make -j1 -C ff-opt-obj DESTDIR=${pkgdir} install

  rm -f ${pkgdir}/usr/bin/firefox
  install -m755 ${srcdir}/firefox.sh ${pkgdir}/usr/bin/firefox-hg

  install -m755 -d ${pkgdir}/usr/share/applications
  install -m755 -d ${pkgdir}/usr/share/pixmaps
  install -m644 ${srcdir}/mozilla-central/browser/branding/nightly/default48.png ${pkgdir}/usr/share/pixmaps/firefox-hg.png
  install -m644 ${srcdir}/firefox-hg.desktop ${pkgdir}/usr/share/applications/
  install -m644 ${srcdir}/firefox-hg-safe.desktop ${pkgdir}/usr/share/applications/
}

