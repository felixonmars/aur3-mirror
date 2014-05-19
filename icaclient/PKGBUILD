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

source_url="http:$(curl -L -silent 'http://www.citrix.com/downloads/citrix-receiver/linux/receiver-for-linux-130.html' | awk -F 'rel=\"' '/linuxx86-/ {print $2}'| awk -F'"' '{print $1}'| sed '/^$/d' |uniq)"
#source=($pkgname-$pkgver.tar.gz::$source_url wfica.sh)
source=('configmgr.desktop'  'conncenter.desktop'  'selfservice.desktop' 'wfica.desktop' 'wfica.sh' 'wfica_assoc.sh' $pkgname-$pkgver.tar.gz::$source_url)
makedepends=('wget')
md5sums=('71aca6257f259996ac59729604f32978'
         'a38c3f844a0fefe8017a25bee213b843'
         '0e92c33b3fcc99b04269787da2984809'
         '1f214f6f456f59afd1a3275580f4240e'
         '59f8e50cc0e0c399d47eb7ace1df5a32'
         'dca5a1f51449ef35f1441b900d622276'
         'fe004c2302660211c73688fe1fa966b1')


#md5sums=('fe004c2302660211c73688fe1fa966b1'
#         '6ebd275423024b5d00812b184c144d0b')

install=citrix-client.install


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
 
  # Create symlinks for util
        ln -s gst_play.64 ./util/gst_play
        ln -s gst_read.64 ./util/gst_read
        ln -s libgstflatstm.64.so ./util/libgstflatstm.so
        ln -s pnabrowse ./util/pnabrowse_launch
 
# Copy Firefox plugin into plugin directory
    mkdir -p "${pkgdir}/usr/lib/mozilla/plugins"
    ln -s ./npica.so "${pkgdir}"/usr/lib/mozilla/plugins/npica.so
    cd "${srcdir}"
    # install freedesktop.org files
    install -Dm644 wfica.desktop "${pkgdir}/usr/share/applications/wfica.desktop"
    install -Dm644 conncenter.desktop "${pkgdir}/usr/share/applications/conncentre.desktop"
    install -Dm644 configmgr.desktop "${pkgdir}/usr/share/applications/configmgr.desktop"
    install -Dm644 selfservice.desktop "${pkgdir}/usr/share/applications/wfcmgr.desktop"
    # install scripts
    install -Dm755 wfica.sh "${pkgdir}${instdir}"
    install -Dm755 wfica_assoc.sh "${pkgdir}${instdir}"

  # Intall License
  #install -m644 -D nls/en/eula.txt \
  #  "$pkgdir/usr/share/licenses/$pkgname/eula.txt"
}


