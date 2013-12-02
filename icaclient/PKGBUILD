# Maintainer: Daniele Vazzola <daniele.vazzola@gmail.com>
# Contributor: Ciarán Coffey <ciaran@ccoffey.ie>
# Contributor: Matthew Gyurgyik <matthew@pyther.net>
pkgname=icaclient
pkgver=13.0.0.256735
pkgrel=9
pkgdesc="Citrix Receiver for Linux (ICAClient)"
arch=('x86_64')
url="http://www.citrix.com/English/ps2/products/product.asp?contentID=1689163&ntref=prod_top"
license=('custom:Citrix')
depends=(
  'lib32-alsa-lib'
  'lib32-libvorbis'
  'lib32-curl'
  'lib32-gtk2'
  'lib32-libpng12'
  'lib32-libxml2'
  'lib32-libxaw'
  'lib32-libxext'
  'lib32-libxft'
  'lib32-libxinerama'
  'lib32-libxmu'
  'lib32-libxp'
  'lib32-libxpm'
  'lib32-libxt'
  'ca-certificates'
  'nspluginwrapper'
)
optdepends=(
  'lib32-xerces-c: gtk2 configuration manager'
  'lib32-webkitgtk2: gtk2 selfservice/storefront ui'
)

conflicts=('bin32-citrix-client' 'citrix-client')
options=(!strip)

source_url="$(curl -L -silent 'http://www.citrix.com/downloads/citrix-receiver/linux/receiver-for-linux-130.html' | awk -F 'rel=\"' '/linuxx86-/ {print $2}'| awk -F'"' '{print $1}'| sed '/^$/d' |uniq)"
source=($pkgname-$pkgver.tar.gz::$source_url wfica.sh)


md5sums=('fe004c2302660211c73688fe1fa966b1'
         '6ebd275423024b5d00812b184c144d0b')

package() {
  cd "${srcdir}"
  ICAROOT=/opt/Citrix/ICAClient

  mkdir -p ${pkgdir}$ICAROOT

  cd "$srcdir/linuxx86/linuxx86.cor"
  install -m755 wfica *.so *.DLL FlashContainer.bin AuthManagerDaemon PrimaryAuthManager ServiceRecord selfservice ${pkgdir}$ICAROOT

  # copy directories
  cp -r ./config/ ${pkgdir}$ICAROOT
  cp -r ./gtk/ ${pkgdir}$ICAROOT
  cp -r ./help/ ${pkgdir}$ICAROOT
  cp -r ./keyboard/ ${pkgdir}$ICAROOT
  cp -r ./keystore/ ${pkgdir}$ICAROOT
  cp -r ./lib/ ${pkgdir}$ICAROOT
  cp -r ./icons/ ${pkgdir}$ICAROOT
  cp -r ./nls/ ${pkgdir}$ICAROOT
  cp -r ./site/ ${pkgdir}$ICAROOT
  cp -r ./usb/ ${pkgdir}$ICAROOT
  cp -r ./util/ ${pkgdir}$ICAROOT

  # create /config/.server to enable user customization using ~/.ICACLient/ overrides. Thanks Tomek
  touch ${pkgdir}$ICAROOT/config/.server  

  # symlink to ca-certs, since provided certs are small
  ln -s /usr/share/ca-certificates/mozilla/* ${pkgdir}$ICAROOT/keystore/cacerts

  # The following 32-bit library causes false namcap errors
  rm util/libgstflatstm.32.so

  # Install wrapper script
  install -m755 ${srcdir}/wfica.sh ${pkgdir}$ICAROOT/wfica.sh

  # Dirty Hack
  # wfica expects {module,wfclient,apssrv}.ini in $ICAROOT/config
  # sadly these configs differ slightly by locale
  lang=${LANG%%_*}
  if [[ ! -d ${pkgdir}/$ICAROOT/nls/$lang ]]; then
    lang='en'
  fi
  cp ${pkgdir}/$ICAROOT/nls/$lang/{appsrv.ini,module.ini,wfclient.ini} ${pkgdir}/$ICAROOT/config/
  
  #Firefox Plugin
  nspluginwrapper -i  ${pkgdir}/$ICAROOT/npica.so


  # Intall License
  install -m644 -D nls/en/eula.txt \
    "$pkgdir/usr/share/licenses/$pkgname/eula.txt"
}


