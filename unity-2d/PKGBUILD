# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=unity-2d
pkgver=5.2.1
pkgrel=1
pkgdesc="A 2d implementation of Unity"
arch=('i686' 'x86_64')
url="https://launchpad.net/unity-2d"
license=('GPL')
depends=('libqtgconf' 'libqtbamf' 'libqtdee' 'libdbusmenu-qt' 'dconf-qt' 'unity-common' 'unity-asset-pool' 'gnome-session' 'gnome-settings-daemon' 'metacity')
makedepends=('cmake' 'boost')
optdepends=('indicator-application: take menus from applications and place them in the panel'
            'indicator-appmenu: host the menus from an application'
            'indicator-datetime: a very, very simple clock'
            'indicator-messages: a place on the users desktop that collects messages that need a response'
            'indicator-power: show the power status of your devices'
            'indicator-session: change your status, switch users'
            'indicator-sound: a unified sound menu'
            'unity-lens-applications: exposes your applications with their usage statistics and status'
            'unity-lens-files: exposing your files and file history'
            'unity-lens-music: music, in the dash')
install=$pkgname.install
source=(https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_$pkgver.orig.tar.gz
        launchpad-export.tar.gz
        disable-multitouch.patch
        fix-imports-dir-location.patch
        fix-adwaita-window-buttons.patch
        unity-2d.xml.defaults
        unity-2d.xml.mandatory
        unity-2d.sh
        unity-2d.session
        unity-2d.desktop)
md5sums=('eafc136865b6d515612c1ed48fd53153'
         'a57fa88abd7972852823ac26ffbc8358'
         '81d19b1570979f439b222e6cd8f835a6'
         'c28661091d2229eb7605f3632a0e13b0'
         '6e0c532cb54daf09fa5cc2e751308fb1'
         'b30cb094467d269e7a74a52e9b46d59a'
         '503ed165d24d9849ddd2894fc46b5569'
         'f469fee111d72f95517ad862e0594fdf'
         '537b2175edab39b428ca5e23676fd700'
         '225b0673f01904c8a903f0a49e3ed4ea')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Disable multitouch support
  patch -Np1 -i "$srcdir/disable-multitouch.patch"

  # Disable accessibility support
  sed -i '/Accessible\.name/d
          /Accessible\.role/d' {launcher,places}/*.qml

  # Fix imports dir location
  patch -Np1 -i "$srcdir/fix-imports-dir-location.patch"

  # Fix window buttons with Adwaita
  patch -Np1 -i "$srcdir/fix-adwaita-window-buttons.patch"

  # Install updated language files
  echo 'af am an ar ast az be bem bg bn bo br bs ca ca@valencia crh cy cs da de el en_AU en_CA en_GB eo es et eu fa fi fil fr fy gd gl gv he hi hr hu hy id is it ja ka kk km kn ko ku ky lb lt lv mg mhr ml mr ms my nb nl nn oc pa pl ps pt pt_BR ro ru sd si sk sl sq sr sv ta te th ti tr tt ug uk ur uz vec vi wae zh_CN zh_HK zh_TW' >po/LINGUAS
  rename $pkgbase- '' ../po/$pkgbase-*.po
  mv -f -t po ../po/*

  [[ -d build ]] || mkdir build
  cd build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"

  make DESTDIR="$pkgdir/" install

  # Install Metacity settings
  install -dm755 "$pkgdir"/etc/gconf/unity-2d.xml.{defaults,mandatory}
  gconftool-2 --direct --config-source xml:readwrite:"$pkgdir/etc/gconf/unity-2d.xml.defaults" --load "$srcdir/unity-2d.xml.defaults"
  gconftool-2 --direct --config-source xml:readwrite:"$pkgdir/etc/gconf/unity-2d.xml.mandatory" --load "$srcdir/unity-2d.xml.mandatory"
  install -Dm755 "$srcdir/unity-2d.sh" "$pkgdir/etc/profile.d/unity-2d.sh"

  # Install session and desktop files
  install -Dm644 "$srcdir/unity-2d.session" "$pkgdir/usr/share/gnome-session/sessions/unity-2d.session"
  install -Dm644 "$srcdir/unity-2d.desktop" "$pkgdir/usr/share/xsessions/unity-2d.desktop"
}
