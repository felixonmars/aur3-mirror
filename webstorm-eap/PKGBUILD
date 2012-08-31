# Maintainer: Eduard Kracmar <edke.kraken[at]gmail[dot]com>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Slava Volkov <sv99sv[at]gmail[dot]com>

pkgname=webstorm-eap
_pkgname=WebStorm # Directory name in the tar file
pkgver=121.150
pkgbuild=121.150
pkgrel=2
pkgdesc="The smartest JavaScript IDE. 30-day free trial."
arch=('i686' 'x86_64')
url="http://www.jetbrains.com/webstorm/"
license=('custom')
depends=('java-runtime>=6')
conflicts=('webstorm')
source=(http://download.jetbrains.com/webide/WebStorm-EAP-$pkgbuild.tar.gz)
#source=(http://download.jetbrains.com/webide/WebStorm-4.0.3.tar.gz)
md5sums=('6e5d66de330efaeb3153b4db5cd19d25')

build() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/opt/${pkgname} || return 1
  cp -R ${srcdir}/${_pkgname}-${pkgbuild}/* ${pkgdir}/opt/${pkgname} || return 1
#  cp -R ${srcdir}/${_pkgname}-${pkgver}/* ${pkgdir}/opt/${pkgname} || return 1
  if [[ $CARCH = 'i686' ]]; then
     rm -f ${pkgdir}/opt/${pkgname}/bin/libyjpagent-linux64.so
     rm -f ${pkgdir}/opt/${pkgname}/bin/fsnotifier64
  fi
  if [[ $CARCH = 'x86_64' ]]; then
     rm -f ${pkgdir}/opt/${pkgname}/bin/libyjpagent-linux.so
     rm -f ${pkgdir}/opt/${pkgname}/bin/fsnotifier
  fi

(
cat <<EOF
[Desktop Entry]
Version=${pkgver}
Name=WebStorm
Icon=webstorm
GenericName=The smartest JavaScript IDE
Comment=The smartest JavaScript IDE. 30-day free trial
Exec=/opt/${pkgname}/bin/webstorm.sh
Terminal=false
Type=Application
Categories=Development
EOF
) > ${startdir}/webstorm.desktop

  mkdir -p ${pkgdir}/usr/bin/ || return 1
  mkdir -p ${pkgdir}/usr/share/applications/ || return 1
  mkdir -p ${pkgdir}/usr/share/pixmaps/ || return 1
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/ || return 1
  install -m 644 ${startdir}/webstorm.desktop ${pkgdir}/usr/share/applications/
  install -m 644 ${pkgdir}/opt/${pkgname}/bin/webide.png ${pkgdir}/usr/share/pixmaps/webstorm.png
  install -m 644 ${srcdir}/${_pkgname}-${pkgbuild}/license/${_pkgname}_license.txt ${pkgdir}/usr/share/licenses/${pkgname}/${_pkgname}_license.txt
  ln -s /opt/$pkgname/bin/webstorm.sh "$pkgdir/usr/bin/webstorm"
}
