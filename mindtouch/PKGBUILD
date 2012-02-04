# Maintainer: Paul Gideon Dann <pdgiddie_AT_gmail_DOT_com>

pkgname=('mindtouch')  # Workaround for AUR
true && pkgname=('mindtouch' 'mindtouch-setup')
pkgver=10.1.0
pkgrel=1
pkgdesc="An enterprise wiki and collaborative portal"

arch=('any')
url="http://sourceforge.net/projects/dekiwiki"
license=('GPL')
makedepends=()
options=(!strip)

_releasename="Pipestone"
_basename="MindTouch_Core_Source"
source=(
  http://sourceforge.net/projects/dekiwiki/files/MindTouch%20Core%20Source/${_releasename}%20${pkgver}/${_basename}_${pkgver}.tar.gz
  path_dirs.patch
  curl_followlocation.patch
  config.patch
  filters.patch
  init-script
  logrotate
  mindtouch-update-db
  mindtouch-install-config
  nginx-rewrites
)
md5sums=('8d67b9b5f177795ce87cf07c47c1b816'
         '409025a7c3084779c2562514f6150ab3'
         '6ebc32a12a532100cc6cf62991f9f6aa'
         'f9708821146f798d5f9e87316f5b6572'
         'e121a3c243bc2a1f0586ac8fa7370fae'
         'efebfbb5aa53106432a2c3ad5b80a94d'
         'b1d88aad11afee0cd4f474898cfee8f4'
         '12b625256ca760c42517ca3792d6e1f0'
         '2e81b936ee8e2b741151d92e4bdc4f11'
         '471b430b4fe38806c51b7ed797b30558')

build() {
  cd "$srcdir/${_basename}_${pkgver}"
  for patch in $srcdir/*.patch; do
    msg2 $(basename $patch)
    patch -Np1 -i $patch
  done
}

package_mindtouch() {
  depends=(imagemagick mono php-gd poppler html2text wv)
  optdepends=('princexml: to export documents to PDF')
  install=(mindtouch.install)

  # PHP Frontend
  cd $srcdir/${_basename}_${pkgver}
  local webapp=$pkgdir/usr/share/webapps/mindtouch
  install -d $pkgdir/usr/share/webapps
  cp -R web $webapp
  rm -rf $webapp/config
  install -d $pkgdir/etc/webapps/mindtouch
  ln -s /etc/webapps/mindtouch/LocalSettings.php $webapp

  # Arch-specific support files
  install -D $srcdir/init-script $pkgdir/etc/rc.d/mindtouch
  install -D -m 644 $srcdir/logrotate $pkgdir/etc/logrotate.d/mindtouch

  # Workaround to allow use of MySQL UNIX socket
  ln -s /usr/lib/mono/4.0/Mono.Posix.dll $webapp/bin

  # Set up storage directories
  install -d $pkgdir/var/lib/mindtouch/attachments
  ln -s /var/lib/mindtouch/attachments $webapp

  install -d $pkgdir/var/lib/mindtouch/cache
  ln -s /var/lib/mindtouch/cache $webapp/bin

  mv $webapp/bin/_x002F_deki $pkgdir/var/lib/mindtouch/licenses
  ln -s /var/lib/mindtouch/licenses $webapp/bin/_x002F_deki

  # Upgrade script
  install -d $pkgdir/usr/bin
  install $srcdir/mindtouch-update-db $pkgdir/usr/bin

  # Nginx rewrite rules
  install -d $pkgdir/usr/share/mindtouch
  install -m 644 $srcdir/nginx-rewrites $pkgdir/usr/share/mindtouch
}

package_mindtouch-setup() {
  depends=(mindtouch)
  install=(mindtouch-setup.install)

  cd $srcdir/${_basename}_${pkgver}
  install -d $pkgdir/usr/share/webapps/mindtouch
  cp -R web/config $pkgdir/usr/share/webapps/mindtouch/config

  install -d $pkgdir/usr/bin
  install $srcdir/mindtouch-install-config $pkgdir/usr/bin
}

# vim:set ts=2 sw=2 et:
