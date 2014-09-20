# Maintainer: Michal Rus <m@michalrus.com>
pkgname=vst-bridge-git
pkgver=0.3.r33.gf1db47d
pkgrel=2
pkgdesc='A bridge to run Windows VST plugins (both 32 and 64 bits) with Linux VST hosts'
arch=('i686' 'x86_64')
url='https://github.com/abique/vst-bridge'
license=('MIT')
depends=(wine file libxcomposite)
options=(!strip)
makedepends()
if [[ $CARCH == 'x86_64' ]]; then
  makedepends+=('gcc-multilib')
  depends+=('gcc-libs-multilib')
else
  makedepends+=('gcc')
  depends+=('gcc-libs')
fi
source=('git+https://github.com/abique/vst-bridge.git'
        'vstsdk360_22_11_2013_build_100.zip::steinberg://dummy')
sha256sums=('SKIP'
            '74e41da563a1c91e86677530936cb46a15f1af76b29d4c1877134cf29eafb718')

steinberg() {
  local steinberg_username='dobzhrej@sharklasers.com'
  local steinberg_password='o87zYwwrBxqaZtm6ArSU'

  local cookiejar=$(mktemp)

  curl --cookie-jar $cookiejar -L \
    'http://www.steinberg.net/nc/en/company/developers/sdk_download_portal.html' >/dev/null

  sleep 1

  curl --cookie $cookiejar --cookie-jar $cookiejar --data \
    'user='$steinberg_username'&pass='$steinberg_password'&submit=Login&logintype=login&pid=0&redirect_url=' \
     -L 'http://www.steinberg.net/nc/en/company/developers/sdk_download_portal.html' >/dev/null

  sleep 1

  curl --cookie $cookiejar --cookie-jar $cookiejar -L \
    'http://www.steinberg.net/nc/en/company/developers/sdk_download_portal/vst_360_audio_plug_ins_sdk.html' >/dev/null

  sleep 1

  local url=$(curl --cookie $cookiejar --cookie-jar $cookiejar --data \
    'vst_status=0&vst_produkte=&vst_produkte_neu=&sdk_daten_speichern=Download VST SDK now' \
     -L 'http://www.steinberg.net/nc/en/company/developers/sdk_download_portal/vst_360_audio_plug_ins_sdk.html' \
     | grep -Pi 'VST.*?SDK</a>' | sed -r 's/^.*href="([^"]+).*$/\1/' | sed -re 's/&amp;/\&/g')

  sleep 1

  curl -o "$1" --cookie $cookiejar --cookie-jar $cookiejar -L \
    'http://www.steinberg.net/'"$url"

  rm $cookiejar
}

export -f steinberg

DLAGENTS=("${DLAGENTS[@]}"
  'steinberg::/usr/bin/bash -c '\''steinberg %o %u'\'''
)

pkgver() {
  cd "$srcdir/vst-bridge"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  msg 'Moving VST SDK files...'
  find "$srcdir/VST3 SDK" -mindepth 1 -maxdepth 1 -exec mv -v '{}' "$srcdir/vst-bridge/vstsdk2.4/" ';'
  rmdir "$srcdir/VST3 SDK"
}

build() {
  cd "$srcdir/vst-bridge"

  # These need to be here… or buffer overflow will happen with Bitwig,
  # see https://github.com/abique/vst-bridge/issues/11#issuecomment-55469180 .
  unset CPPFLAGS
  unset CFLAGS
  unset CXXFLAGS
  unset LDFLAGS

  ./configure --debug --prefix=/usr
  make
}

package() {
  cd "$srcdir/vst-bridge"
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
