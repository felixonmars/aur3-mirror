# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Urs Wolfer <uwolfer @ fwo.ch>
pkgname=intellij-idea-12-ultimate
pkgver=12.1.7b
_buildver=129.1525
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
sha256sums=('4380c797660b7c53132c29f84facdb485c548c92960683ec0df83a5ab41bd4ed'
            '289c9e1ca4b030bfc0e73840ed758fcc654fd1c37d1648b6647f2a5c43fbdf64'
            'fbe132c577377dac04ce28e18a53d7637123977bbf550ad42fe621a8ebab02d7')

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
