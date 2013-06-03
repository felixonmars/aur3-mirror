# Maintainer : <speps at aur dot archlinux dot org>

pkgbase=distrho-git
pkgname=distrho-git
true && pkgname=('distrho-standalone-git' 'distrho-lv2-git' 'distrho-vst-git')
#true && pkgname+=('distrho-dssi-git' 'distrho-extra-git')
pkgver=497.b61da17
pkgrel=1
pkgdesc="Cross-Platform Audio Plugins, using the JUCE Toolkit"
arch=('i686' 'x86_64')
url="http://distrho.sourceforge.net/"
license=('GPL' 'GPL3' 'LGPL')
makedepends=('premake3' 'jack' 'lv2' 'libxinerama' 'fftw'
             'libxrender' 'libxcursor' 'csound' 'qt4')
source=("$pkgbase::git+git://distrho.git.sf.net/gitroot/distrho/distrho"
        "vst_sdk2_4_rev2.zip")
#        Q9EEAi^^HHH]5:E9]:E^=:DE:?8^GDE0DEF77^GDE0D5<a0c0C6Ga]K:AQX
noextract=("${source[1]}")
md5sums=('SKIP'
         'b4b496306a95e422ccffd0e73b87a870')

pkgver() {
  cd "$srcdir/$pkgbase"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$pkgbase"

  # placing the vst sdk
  unzip "$srcdir/${source[1]}" -d sdks

  # generate build script
  scripts/premake-update.sh linux

  make standalone{,-host} lv2 vst # dssi?
}

package_distrho-standalone-git() {
  true && pkgdesc=("Distrho Standalone Audio Plugins, using the JUCE Toolkit")
  true && depends=('alsa-lib' 'freetype2' 'libxext')
  true && optdepends=('jack: jack audio support'
                      'csound: cabbage plugins')
  true && provides=('distrho-standalone' 'distrho-plugins')
  true && conflicts=('distrho-standalone')
  cd "$srcdir/$pkgbase"

  # standalone bins
  install -d "$pkgdir/usr/bin"
  find bin/standalone -maxdepth 1 -type f ! -name "*.so" -exec \
  install -Dm755 {} "$pkgdir/usr/bin" \;

  # cabbage libs
  install -d "$pkgdir/usr/lib"
  install -Dm755 bin/standalone/*.so "$pkgdir/usr/lib"

  # cabbage synths and effects (csd)
  install -d "$pkgdir/usr/share/cabbage"
  cp -a bin/cabbage/* "$pkgdir/usr/share/cabbage"
}

package_distrho-lv2-git() {
  true && pkgdesc=("Distrho LV2 Audio Plugins, using the JUCE Toolkit")
  true && depends=('lv2' 'alsa-lib' 'freetype2' 'libxext')
  true && optdepends=('jack: jack audio support'
                      'csound: cabbage plugins')
  true && provides=('distrho-lv2' 'distrho-plugins')
  true && conflicts=('distrho-lv2' 'distrho-plugins-lv2-git')
  true && replaces=('distrho-plugins-lv2-git')
  cd "$srcdir/$pkgbase"

  # lv2 plugins
  install -d "$pkgdir/usr/lib/lv2"
  cp -a bin/lv2/* "$pkgdir/usr/lib/lv2"
}

package_distrho-vst-git() {
  true && pkgdesc=("Distrho VST Audio Plugins, using the JUCE Toolkit")
  true && depends=('alsa-lib')
  true && optdepends=('jack: jack audio support')
  true && provides=('distrho-vst' 'distrho-plugins')
  true && conflicts=('distrho-vst')
  cd "$srcdir/$pkgbase"

  # vst plugins
  install -d "$pkgdir/usr/lib/vst"
  cp -a bin/vst/* "$pkgdir/usr/lib/vst"
}

# There's dssi in Makefile - leave here for the future
#
#package_distrho-dssi-git() {
#  true && pkgdesc=("Distrho DSSI Audio Plugins, using the JUCE Toolkit")
#  true && depends=('dssi' 'alsa-lib')
#  true && optdepends=('jack: jack audio support')
#  true && provides=('distrho-dssi' 'distrho-plugins')
#  true && conflicts=('distrho-dssi')
#  cd "$srcdir/$pkgbase"
#
#  # dssi plugins
#  install -d "$pkgdir/usr/lib/dssi"
#  cp -a bin/dssi/* "$pkgdir/usr/lib/dssi"
#}

# HybridReverb2 is not there anymore - extra now contains nothing
#
#package_distrho-extra-git() {
#  true && pkgdesc=("Extras from Distrho Audio Plugins (Cabbage)")
#  true && arch=('any')
#  true && depends=('distrho-plugins')
#  true && provides=('distrho-extra')
#  true && conflicts=('distrho-extra')
#  cd "$srcdir/$pkgbase"
#
#  # cabbage presets
#  cd ports/hybridreverb2/data
#  install -Dm644 HybridReverb2.conf \
#    "$pkgdir/etc/HybridReverb2/HybridReverb2.conf"
#  install -d "$pkgdir/usr/share"
#  cp -a HybridReverb2 \
#    "$pkgdir/usr/share"
#}

# vim:set ts=2 sw=2 et:
