if [[ ! -f username ]]
then
export user=`eval whoami`
echo $user > username
echo "building lazarus-user for $user"
touch once
else
user=`cat username`
rm username
echo "Checking download integrity"
fi
rm -f laz.install
echo "post_install() {" >> laz.install
echo "    chown -hR $user /home/$user/.local/usr" >> laz.install
echo "    echo "Local permissions corrected"" >> laz.install
echo "    echo "Removing any root lararus artifacts"" >> laz.install
echo "    rm -rf /usr/lib/lazarus" >> laz.install
echo "    rm -rf /root/.lazarus" >> laz.install
echo "    echo "Done !"" >> laz.install
echo "} " >> laz.install
echo "" >> laz.install
echo "post_upgrade() {" >> laz.install
echo "    post_install" >> laz.install
echo "}" >> laz.install
pkgname=lazarus-snapshot-user
if [[ -f once ]]
then
rm once
lv=(`wget --spider --force-html -r -l1 http://mirrors.iwi.me/lazarus/snapshots/ 2>&1 | grep http://mirrors.iwi.me/lazarus/snapshots/lazarus-1.1 | grep src.tar.bz2 | sed '2!d'`)
newsource="${lv/http:\/\/mirrors.iwi.me\/lazarus\/snapshots\//}"
mkdir -p src
wget "$lv" -P src/
cd src
echo "$lv" > tempy.txt
tar -xf $newsource
pkgrel=(`cut -f 3 -d "-" tempy.txt`)
pkgrel=(`cut -f 3 -d "-" tempy.txt`.`cut -f 4 -d "-" tempy.txt`)
rm -f tempy.txt
rm -f $newsource
cd ../
echo $pkgrel > rel
rm -rv mirrors.iwi.me/*
rmdir mirrors.iwi.me
else
pkgrel=`cat rel`
rm rel
fi
pkgver=1.1
pkgdesc='Delphi-like IDE for FreePascal, (Snapshop version that installs as user, avoiding root issues)'
url='http://www.lazarus.freepascal.org/'
license=('GPL2' 'MPL' 'custom:LGPL')
arch=('i686' 'x86_64')
depends=('fpc' 'fpc-src' 'gtk2')
options=('!emptydirs' '!makeflags')
provides=('lazarus' 'lazarus-gtk2')
replaces=('lazarus' 'lazarus-gtk2')
conflicts=('lazarus' 'lazarus-gtk2')
install=laz.install

build() {
  cd $srcdir/lazarus
  make FPC=/usr/bin/fpc clean bigide
}

package() {
  cd $srcdir/lazarus

  # skip the 'make install' mess completely and do everything manually
  mkdir -p $pkgdir/home/$user/.local/usr/lib/lazarus $pkgdir/usr/bin $pkgdir/usr/share/man/man1 $pkgdir/usr/share/doc
  rm -r debian
  cp -R . $pkgdir/home/$user/.local/usr/lib/lazarus

  ln -s /home/$user/.local/usr/lib/lazarus/lazarus $pkgdir/usr/bin/lazarus
  ln -s /home/$user/.local/usr/lib/lazarus/startlazarus $pkgdir/usr/bin/startlazarus
  ln -s /home/$user/.local/usr/lib/lazarus/lazbuild $pkgdir/usr/bin/lazbuild

  cp -R install/man/man1/* $pkgdir/usr/share/man/man1/

  #mv $pkgdir/home/$user/.local/usr/lib/lazarus/docs $pkgdir/usr/share/doc/lazarus

  # make 'desktop-file-validate' happy and fix missing .png icon
  sed -e 's|\(Categories\).*|\1=IDE;Development;|' \
      -e 's|\.png|\.xpm|' -i install/lazarus.desktop
  install -Dm644 install/lazarus.desktop $pkgdir/usr/share/applications/lazarus.desktop
  install -Dm644 images/ide_icon48x48.png $pkgdir/usr/share/pixmaps/lazarus.png
  rm -r $pkgdir/home/$user/.local/usr/lib/lazarus/install

  # license files: /home/$user/.local/usr/lib/lazarus/COPYING*
  install -D -m644 COPYING.modifiedLGPL.txt $pkgdir/usr/share/licenses/lazarus/COPYING.modifiedLGPL

  # strip
  find $pkgdir -perm /ugo+x -type f -exec strip {} \;
  find $pkgdir -name \*.so -type f -exec strip {} \;

}
