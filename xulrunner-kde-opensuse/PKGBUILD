# Maintainer: Björn Bidar <theodorstormgrade@gmail.com>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

pkgname=xulrunner-kde-opensuse
pkgver=23.0
pkgrel=1
pkgdesc="Mozilla Runtime Environment, with OpenSUSE patch, integrate better with KDE"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'mozilla-common' 'nss>=3.14.1' 'libxt' 'libxrender' 'hunspell' 'startup-notification' 'mime-types' 'dbus-glib' 'alsa-lib' 'libevent' 'sqlite>=3.7.4' 'libvpx' 'python2' 'kmozillahelper>=0.6')
provides='xulrunner'
conflicts='xulrunner'
replaces=('xulrunner-oss' 'xulrunner' )
makedepends=('zip' 'unzip' 'pkg-config' 'diffutils' 'yasm' 'mesa' 'autoconf2.13')
url="http://wiki.mozilla.org/XUL:Xul_Runner"
_patchurl=https://build.opensuse.org/package/rawsourcefile/mozilla:Factory/MozillaFirefox
_patchrev=cdf792b65a71d76e6cb48d838870b3ec
source=(ftp://ftp.mozilla.org/pub/mozilla.org/xulrunner/releases/$pkgver/source/xulrunner-$pkgver.source.tar.bz2
        mozconfig
	cairo-shared.patch
        shared-libs.patch
	firefox-kde.patch::$_patchurl/firefox-kde.patch?srcmd5=$_patchrev
	mozilla-kde.patch::$_patchurl/mozilla-kde.patch?srcmd5=$_patchrev
	mozilla-nongnome-proxies.patch::$_patchurl/mozilla-nongnome-proxies.patch?srcmd5=$_patchrev
	firefox-branded-icons.patch::$_patchurl/firefox-branded-icons.patch?srcmd5=$_patchrev
	firefox-browser-css.patch::$_patchurl/firefox-browser-css.patch?srcmd5=$_patchrev
	firefox-kde-114.patch::$_patchurl/firefox-kde-114.patch?srcmd5=$_patchrev
	firefox-no-default-ualocale.patch::$_patchurl/firefox-no-default-ualocale.patch?srcmd5=$_patchrev
	mozilla-language.patch::$_patchurl/mozilla-language.patch?srcmd5=$_patchrev
	mozilla-prefer_plugin_pref.patch::$_patchurl/mozilla-prefer_plugin_pref.patch?srcmd5=$_patchrev
	mozilla-preferences.patch::$_patchurl/mozilla-preferences.patch?srcmd5=$_patchrev
	toolkit-download-folder.patch::$_patchurl/toolkit-download-folder.patch?srcmd5=$_patchrev
	unity-menubar.patch
)

sha256sums=('b40b13dc145c34d9f7bb17d0b0b00fb55868daee0de8b9fa5d05e15197e69131'
            '4e5032d9a48438b74430fc958e08cd81e1306b039f8a210d59669f8221ad18fe'
            '2e2bdebd7878717d4c4560f6394ce6ceb6a6e00b51f61494c47bd73937a56dc0'
            'e2b4a00d14f4ba69c62b3f9ef9908263fbab179ba8004197cbc67edbd916fdf1'
            '51c538afe80fad52a7f070faacd9955a59703e69c17f50abad96adaf91b10467'
            '0cfa85f113e581e5d40e9d7eed6aaab05b76f1cd21f10d4545dff1a657bedd19'
            '5bf1f1f661a4598545161f7a22c01713f2c1fdab94a736694e866843ff64c74d'
            'efaa8f9db82b55b12e893b2ea5be243f910892d9ebf3a500eb5178b2f2ad070d'
            '97da9ddd2110ff74800bcf288947ca6e84b0c7d67f4c8d24524cfd49aa90fcce'
            '1fd54e93db3a4d454ece5a6dc788a4ae36805eb497482add82a11ac5cf990562'
            'dab135c33f8d5e2887ae59b7b123894899060e4acdd4d0b6e800d5247c059441'
            'aca072853b379201b0d8ac8128eb6e0e8255ab0c955d7bfd48f6273c8bf245d5'
            '5f6b0970284d68d5ed18e6bb7ee1e9fc0025ab3c10aaa14c283adb21a4a20ee8'
            '75a0817c601bbe6b0a89fbc6ea327397ff296ad336d139b764421dab1dbf55cc'
            'e368d490192e8c83d2d209faa90a8bb0bff89e7d8d08d728001effe433f28e6f'
            'b09312851d93189b448c7118539e29fd9296d1bd6679f7f9d1815e6134539ea4')
options=('!emptydirs')

prepare() {
  cd "$srcdir/mozilla-release"
  cp "$srcdir/mozconfig" .mozconfig

    rm -f toolkit/xre/nsKDEUtils.cpp \
        toolkit/xre/nsKDEUtils.h \
        uriloader/exthandler/unix/nsCommonRegistry.cpp \
        uriloader/exthandler/unix/nsCommonRegistry.h \
        uriloader/exthandler/unix/nsKDERegistry.cpp \
        uriloader/exthandler/unix/nsKDERegistry.h \
        toolkit/content/widgets/dialog-kde.xml \
        toolkit/content/widgets/preferences-kde.xml 
  #fix libdir/sdkdir - fedora
    patch -Np1 -i "$srcdir/mozilla-nongnome-proxies.patch"
  patch -Np1 -i "$srcdir/mozilla-kde.patch"
  patch -Np1 -i "$srcdir/firefox-kde.patch"
  patch -Np1 -i "$srcdir/firefox-branded-icons.patch"
  patch -Np1 -i "$srcdir/firefox-browser-css.patch"
  patch -Np1 -i "$srcdir/firefox-kde-114.patch"
  patch -Np1 -i "$srcdir/firefox-no-default-ualocale.patch"
  patch -Np1 -i "$srcdir/mozilla-language.patch"
  patch -Np1 -i "$srcdir/mozilla-prefer_plugin_pref.patch"
  patch -Np1 -i "$srcdir/mozilla-preferences.patch"
  patch -Np1 -i ../shared-libs.patch
  patch -Np1 -i ../cairo-shared.patch
  patch -Np1 -i "$srcdir/unity-menubar.patch"

  # WebRTC build tries to execute "python" and expects Python 2
  # Workaround taken from chromium PKGBUILD
  mkdir "$srcdir/python2-path"
  ln -s /usr/bin/python2 "$srcdir/python2-path/python"

  # configure script misdetects the preprocessor without an optimization level
  # https://bugs.archlinux.org/task/34644
  sed -i '/ac_cpp=/s/$CPPFLAGS/& -O2/' configure
}

build() {
  cd "$srcdir/mozilla-release"

  export PATH="$srcdir/python2-path:$PATH"
  export LDFLAGS="$LDFLAGS -Wl,-rpath,/usr/lib/xulrunner-$pkgver"
  export PYTHON="/usr/bin/python2"

  make -j1 -f client.mk build MOZ_MAKE_FLAGS="$MAKEFLAGS"
}

package() {
  cd "$srcdir/mozilla-release"
  make -j1 -f client.mk DESTDIR="$pkgdir" install

  rm -rf "$pkgdir"/usr/lib/xulrunner-$pkgver/{dictionaries,hyphenation}
  ln -sf /usr/share/hunspell "$pkgdir/usr/lib/xulrunner-$pkgver/dictionaries"
  ln -sf /usr/share/hyphen "$pkgdir/usr/lib/xulrunner-$pkgver/hyphenation"

  # add xulrunner library path to ld.so.conf
  install -d $pkgdir/etc/ld.so.conf.d
  echo "/usr/lib/xulrunner-$pkgver" > $pkgdir/etc/ld.so.conf.d/xulrunner.conf

  chmod +x "${pkgdir}/usr/lib/xulrunner-devel-$pkgver/sdk/bin/xpt.py"
  sed -i 's|!/usr/bin/env python$|!/usr/bin/env python2|' \
    "$pkgdir"/usr/lib/xulrunner-devel-$pkgver/sdk/bin/{xpt,header,typelib,xpidl}.py
}
