# Contributor: MutantMonkey <mutantmonkey@gmail.com>
pkgname=firefox-qt-hg
pkgver=56394
pkgrel=1
_ffver="4.0b8pre"
pkgdesc="Standalone web browser from mozilla.org, latest development version, Qt build"
url="http://www.mozilla.org/projects/firefox/"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('qt' 'gcc-libs>=4.4.0' 'libidl2>=0.8.13' 'mozilla-common' 'nss>=3.12.3' 'nspr>=4.8' 'libxt' 'hunspell>=1.2.8' 'startup-notification>=0.10' 'pango>=1.24.0' 'desktop-file-utils' 'cairo>=1.8.0' 'libpng>=1.2.24-3' 'libjpeg' 'lcms' 'mesa' 'libproxy')
makedepends=('mercurial' 'zip' 'diffutils' 'imagemagick' 'python' 'xorg-server' 'autoconf2.13' 'libnotify' 'wireless_tools' 'yasm')
optdepends=('libnotify' 'wireless_tools')
provides=("firefox-qt=${_ffver}")
install=firefox-qt.install
source=(mozconfig
        firefox-qt-hg.desktop
        firefox-qt-hg-safe.desktop
        firefox-qt.sh
        fix_python.patch
        firefox-qt-hg-experimentalprofile.desktop                                                                                                                                                     
        firefox-qt-hg-experimentalprofile.sh                                                                                                                                                          
        firefox-qt-hg-freshprofile.sh                                                                                                                                                                 
        firefox-qt-hg-restoreprofile.sh 
)

md5sums=('b9292e457d2895b220501e6e9ecd7b7e'
         'b6b994c510cc0a383f0834df63048e16'
         '37f48f7fe970fb38de3a60d3d9ff6603'
         '18d2a146f515bb6cef524ef4df4dd2d2'
         'ebd8d22447e3fd68ca3ca47e78ff2d2f'
         '7e52d42a6bb0b0ae93ba7ec3abbdc447'
         '22fc92456ec98e3c8e27f62a211eaa02'
         'd511803ba41cbc4fadab88f74cade8fd'
         '2249025aeabf6ce6d53e5d986e1e843a')
sha256sums=('b6918c46a8261650c7e5a09dd6496e9066d5e986598d7047bc047909256cf243'
            'd09f7446320d1e8719608de16e35ec82b93c93ae7738d837fecd0b5fe7f18bc4'
            'c74a84f4be3e15713a670a3e8d17be2957f7131486d9d0543760bb7965cc3746'
            'dc1129e701cf1bc5b0909f88fa3bf331048e24c9115aba4d4b6ca347f18c55dd'
            'cdc09d2814305ac888b6811f77a0cd81cdc70ba2f64410b399e59b05cf1937b5'
            '9a922720cab2e132ead88866a87a2104d1940b8844e0ce944646aacbffea480d'
            '5c4c32f856811d1bba328927898891a5135d93ed2094bb23a24537f196e6b998'
            '46df2339ea8cc3a269773bf93eaf49a609776f3498864d1e758ca046237629fd'
            '1058a492c34047d79e9977d32db0bcbe18eae1771d883956f4be0cdfcf338ef2')

_hgroot="http://hg.mozilla.org"
_hgrepo=mozilla-central

build() {
  cd ${srcdir}/mozilla-central
  cp ${srcdir}/mozconfig .mozconfig
  
  # update firefox-qt.sh launcher with proper Firefox version
  sed -i "s/firefox-qt-hg/firefox-qt-${_ffver}/g" ${srcdir}/firefox-qt.sh
  
  unset CFLAGS
  unset CXXFLAGS
  export LDFLAGS="-Wl,-rpath,/usr/lib/firefox-qt-${_ffver}"

  # fix problems with python scripts (python2 scripts incompatible with python3)
  patch -Np1 -i "${srcdir}/fix_python.patch" || return 1

  make -f client.mk MOZ_MAKE_FLAGS="${MAKEFLAGS}" || return 1
  make -C ff-opt-obj DESTDIR=${pkgdir} install || return 1
}

package() {
  rm -f ${pkgdir}/usr/bin/firefox
  install -m755 ${srcdir}/firefox-qt.sh ${pkgdir}/usr/bin/firefox-qt-hg || return 1
  install -m755 ${srcdir}/firefox-qt-hg-experimentalprofile.sh ${pkgdir}/usr/bin/firefox-qt-hg-experimentalprofile || return 1
  install -m755 ${srcdir}/firefox-qt-hg-freshprofile.sh ${pkgdir}/usr/bin/firefox-qt-hg-freshprofile || return 1
  install -m755 ${srcdir}/firefox-qt-hg-restoreprofile.sh ${pkgdir}/usr/bin/firefox-qt-hg-restoreprofile || return 1

  install -m755 -d ${pkgdir}/usr/share/applications
  install -m755 -d ${pkgdir}/usr/share/pixmaps
  install -m644 ${srcdir}/mozilla-central/browser/branding/nightly/default48.png ${pkgdir}/usr/share/pixmaps/firefox-qt-hg.png || return 1
  install -m644 ${srcdir}/firefox-qt-hg.desktop ${pkgdir}/usr/share/applications/ || return 1
  install -m644 ${srcdir}/firefox-qt-hg-safe.desktop ${pkgdir}/usr/share/applications/ || return 1
  install -m644 ${srcdir}/firefox-qt-hg-experimentalprofile.desktop ${pkgdir}/usr/share/applications/ || return 1
}

