# Maintainer: Rasmus Steinke <rasi@xssn.at>

pkgname=soundbounce-git
pkgver=20150110
pkgrel=1
pkgdesc="Social listening for Spotify"
arch=('i686' 'x86_64')
depends=('libudev.so.0' 'nodejs' 'libspotify')
makedepends=('git' 'nw-gyp')
url="https://github.com/pdaddyo/soundbounce"
license=('MIT')
source=(git+https://github.com/pdaddyo/soundbounce
        soundbounce.png
        soundbounce.desktop
        app.key)
sha256sums=('SKIP'
            'efd138372f983af45b947eac5a6c4de4ae476a0f0bc6d8740fc7de0bb1243feb'
            'e8170dd17126bcb3d19affe157c5530d0a275a1bde8e785e40938e5b3aede583'
            '37368a7d1c986f353515e2813cf00d8cecefa9558d92453d9d78ce76c5aa8c0c')
provides=('soundbounce')
conflicts=('soundbounce')
options=('!emptydirs' '!strip')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${srcdir}/${pkgname%-git}/src/client-node-webkit/node-spotify-master
  sed -i 's/.*\"libraries\"\: \[\"\-framework OpenAL \-framework libspotify\"\]/        "libraries"\: \[\"\-lasound \-lspotify\"\]/g' binding.gyp
  cd ${srcdir}/${pkgname%-git}/src/client-node-webkit/osx
  sed -i 's/.*\"toolbar\"\: true,/\"toolbar\"\: false,/g' package.json
}

build() {
  cd ${srcdir}/${pkgname%-git}/src/client-node-webkit/node-spotify-master
  npm install nodewebkit@0.8.6
  nw-gyp configure --target=0.8.6 --python=python2
  nw-gyp build --target=0.8.6 --python=python2
}

package() {
  msg 'Installing license...'
  install -Dm 644 ${srcdir}/${pkgname%-git}/LICENSE.md $pkgdir/usr/share/license/soundbounce/LICENSE

  msg 'Installing application'
  cd ${srcdir}/${pkgname%-git}/src
  cd client-node-webkit
  rm -f Screen*.png
  install -dm 755 $pkgdir/opt/soundbounce
  for _appdir in ./; do
    cp -dpr --no-preserve=ownership $_appdir $pkgdir/opt/soundbounce/$_appdir
  done
  cp -dpr --no-preserve=ownership ${srcdir}/../app.key ${pkgdir}/opt/soundbounce/osx
  cp -dpr --no-preserve=ownership ${srcdir}/../soundbounce.png ${pkgdir}/opt/soundbounce/soundbounce.png
  install -dm 755 ${pkgdir}/usr/share/applications
  cp -dpr --no-preserve=ownership ${srcdir}/../soundbounce.desktop ${pkgdir}/usr/share/applications

  msg 'Creating symlink'
  install -dm 755 $pkgdir/usr/bin
  cd ${pkgdir}/usr/bin
  cat << EOF > soundbounce
#!/bin/bash

export NODE_PATH="/opt/soundbounce/node-spotify-master/build/Release"
/opt/soundbounce/node-spotify-master/node_modules/nodewebkit/nodewebkit/nw /opt/soundbounce/osx
EOF
  chmod +x soundbounce

  msg 'Cleaning up pkgdir...'
  find ${pkgdir} -type d -name .git -delete
  find ${pkgdir} -type f -name .gitignore -delete
}
