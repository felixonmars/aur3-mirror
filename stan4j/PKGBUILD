# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=stan4j
_pkgname=stan
pkgver=2.0.3
_pkgdate=20120309
pkgrel=1
pkgdesc="Java structure analysis tool."
arch=(i686 x86_64)
url="http://stan4j.com"
license=(commercial)
depends=('java-runtime>=6' 'gtk2' 'desktop-file-utils')
backup=(opt/${pkgname}/${_pkgname}.ini)
changelog=Changelog
if [[ ${CARCH} = x86_64 ]];
  then _arch=x86_64; md5sums=('27ceda8d502f462022eb91bee1a98d0a')
  else _arch=x86;    md5sums=('87d291b4f776db9c3b363f193131db2d')
fi
source=(http://download.stan4j.com/app/stan-${pkgver}.v${_pkgdate}-linux.gtk.${_arch}.zip)

build() {
  msg2 "Generate desktop application entry..."
  cat > "${srcdir}"/${pkgname}.desktop << EOF
[Desktop Entry]
Version=${pkgver}
Encoding=UTF-8
Name=Stan
Comment=${pkgdesc}
Exec=/usr/bin/${pkgname}
Icon=/opt/${pkgname}/icon.xpm
Terminal=false
Type=Application
Categories=Development;
EOF
}

package() {
  msg2 "Install the assembly at /opt/${pkgname}..."
  install -dm755                  "${pkgdir}"/opt/${pkgname}
  cp -a "${srcdir}"/${_pkgname}/* "${pkgdir}"/opt/${pkgname}

  msg2 "Install links to the executables in /usr/bin..."
  install -dm755                   "${pkgdir}"/usr/bin
  ln -s /opt/${pkgname}/${_pkgname} "${pkgdir}"/usr/bin/${pkgname}

  msg2 "Install links to the documentation resources in /usr/share/doc/${pkgname}..."
  install -dm755                    "${pkgdir}"/usr/share/doc/${pkgname}
  ln -s /opt/${pkgname}/about.html  "${pkgdir}"/usr/share/doc/${pkgname}/
  ln -s /opt/${pkgname}/about_files "${pkgdir}"/usr/share/doc/${pkgname}/

  msg2 "Install link to the config file in /etc..."
  install -dm755                        "${pkgdir}"/etc
  ln -s /opt/${pkgname}/${_pkgname}.ini "${pkgdir}"/etc/${pkgname}.ini

  msg2 "Install desktop application entry in /usr/share/applications..."
  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
