# Contributor: Yaohan Chen <yaohan.chen@gmail.com>
# Contributor: p2k <Patrick.Schneider@uni-ulm.de>
# Contributor: Schtroumpfette <fpeterschmitt@voila.fr>
pkgname=dofus-uplauncher
pkgver=2.11.0
pkgrel=1
pkgdesc="A manga inspired, Massively Multiplayer Online Role-playing Game (MMORPG) for Adobe AIR."
url="http://www.dofus.com/"
license=("custom:Dofus License")
arch=('i686' 'x86_64')
source=(http://dl.ak.ankama.com/games/dofus2/setup/DofusInstall.run air-generic-launcher.sh UpLauncher.arch.sh)
if [ "$CARCH" == "x86_64" ];then
  depends=('adobe-air-sdk' 'lib32-gtk2' 'lib32-libxt'
           'lib32-libjpeg6' 'lib32-libpng12' 'lib32-openssl098'
           'lib32-libldap' 'lib32-gvfs' 'lib32-nss' 'lib32-libxslt'
           'lib32-dbus-glib' 'lib32-alsa-lib')
else
  depends=('adobe-air-sdk' 'gtk2' 'libxt'
           'libjpeg6' 'libpng12' 'openssl098'
           'gvfs' 'nss' 'libxslt' 'alsa-lib')
fi
install=dofus.install
md5sums=('6ab70b3109f7de548982b79dd5a409b1'
         'f179eaa5e6e6674b1853cf826fc33c3a'
         'def0460bc85cf8d4506bbd2493cae420')

build() {
  cd "$srcdir"

  msg2 "Extracting installer..."
  sh ./DofusInstall.run --noexec --keep --target dofus_install
}

package() {
  cd "$srcdir/dofus_install"
  install_dir="$pkgdir/opt/dofus"
  mkdir -p "$install_dir"

  msg2 "Installing main applications..."
  cp -R Dofus/* "$install_dir"
  chmod 0775 "$install_dir/share"
  install "$srcdir/air-generic-launcher.sh" "$install_dir/bin/air-generic-launcher.sh"
  ln -sf "$install_dir/bin/air-generic-launcher.sh" "$install_dir/bin/Dofus"
  cp -R Reg "$install_dir/share/reg"
  chmod 0775 "$install_dir/share/reg" "$install_dir/share/reg/share"
  install "$srcdir/air-generic-launcher.sh" "$install_dir/share/reg/bin/Reg"

  msg2 "Installing additional content..."
  ln -s ../Reg.swf "$install_dir/share/reg/share/Reg.swf"
  ln -s ../content "$install_dir/share/reg/share/content"
  install UpLauncher "$install_dir/share/UpLauncher"
  install -m 644 uplauncherComponents.xml "$install_dir/share/uplauncherComponents.xml"

  msg2 "Installing launcher script..."
  install "$srcdir/UpLauncher.arch.sh" "$install_dir/share/UpLauncher.arch.sh"
  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/dofus/share/UpLauncher.arch.sh "$pkgdir/usr/bin/dofus-uplauncher"

  msg2 "Installing menu icon..."
  mkdir -p "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/dofus-uplauncher.desktop" <<EOF
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=Dofus (UpLauncher)
GenericName=Dofus (UpLauncher)
Comment=Dofus (UpLauncher)
Icon=/opt/dofus/share/icon/dofus-icon-48.png
Exec=/opt/dofus/share/UpLauncher.arch.sh
Path=/opt/dofus/share/
Categories=Game;RolePlaying;Ankama-Games
EOF

  msg2 "Installing licenses..."
  mkdir -p "$pkgdir/usr/share/licenses/dofus"
  cp -R licenses/*.txt "$pkgdir/usr/share/licenses/dofus"
  chmod 0644 "$pkgdir/usr/share/licenses/dofus"/*
}
# vim:set ts=2 sw=2 et:
