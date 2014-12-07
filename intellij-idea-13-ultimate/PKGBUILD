# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
pkgname=intellij-idea-13-ultimate
pkgver=13.1.6
_buildver=135.1306
pkgrel=1
pkgdesc='An intelligent IDE for Java, Groovy and other programming languages with advanced refactoring features intensely focused on developer productivity.'
arch=('i686' 'x86_64') # not 'any' because of fsnotifier
url="http://www.jetbrains.com/idea/"
backup=("usr/share/${pkgname}/bin/idea.vmoptions" "usr/share/${pkgname}/bin/idea64.vmoptions")
license=('Commercial')
depends=('java-environment' 'giflib')
options=(!strip)
source=("http://download.jetbrains.com/idea/ideaIU-${pkgver}.tar.gz"
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha256sums=('24dbeb9fba7ea2d8bade9a9962dd75b443b89c2ca10fcf29f4334dae6df17729'
            'c543ebfa12d2bbe126f536850f2fa1e8bcb3407210279d3da4e80d431dc3ada2'
            '24488c0cb64b776c9f6caf4f5672a12f0c8ed296f0f9fc500e53becfbd475d4b')

package() {
  cd "${srcdir}"

  install -d -m755 $pkgdir/usr/{bin,share}
  cp -a "idea-IU-${_buildver}" "${pkgdir}/usr/share/${pkgname}"
  chown -R root:root "${pkgdir}/usr/share"

  find $pkgdir/usr/share/$pkgname -type d -exec chmod 0755 {} ';'
  find $pkgdir/usr/share/$pkgname -type f -exec chmod 0644 {} ';'

  # never wait on user input when starting idea; copied from -ce PKGBUILD
  sed -i '/.*read IGNORE.*/ d' "${pkgdir}"/usr/share/$pkgname/bin/idea.sh

  chmod +x $pkgdir/usr/share/$pkgname/bin/idea.sh
  chmod +x "$pkgdir"/usr/share/$pkgname/bin/fsnotifier
  chmod +x "$pkgdir"/usr/share/$pkgname/bin/fsnotifier64

  install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "$srcdir/idea-IU-$_buildver/bin/idea.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -D -m644 "$srcdir/idea-IU-$_buildver/license/IDEA_license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
