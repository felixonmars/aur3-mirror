# UnderBudget: Installer: Arch
# Maintainer: Kyle Treubig <kyle [at] vimofthevine [dot] com>

pkgname=underbudget-git
fullname=UnderBudget
pkgver=2.0a
pkgrel=1
pkgdesc="Budget analysis designed to work with GnuCash, Quicken, mint.com, etc."
arch=('i686' 'x86_64')
depends=('java-runtime')
makedepends=('git' 'apache-ant')
url=('http://underbudget.vimofthevine.com')
license=('Apache')

_gitroot="git://github.com/vimofthevine/UnderBudget.git"
_gitname="underbudget"

build() {
	cd $srcdir
	msg "Connecting to git server..."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "Git checkout done or server timeout"
	msg "Building jars..."

	cd $_gitname
	ant cli
}

package() {
  cd $srcdir/$_gitname

  install -Dm644 data/underbudgetcli.desktop ${pkgdir}/usr/share/applications/underbudgetcli.desktop
  install -Dm644 data/underbudget.png ${pkgdir}/usr/share/pixmaps/underbudget.png

  install -Dm644 build/jar/UnderBudgetCli.jar ${pkgdir}/usr/share/java/underbudget/UnderBudgetCli.jar

  install -Dm644 data/logging.properties ${pkgdir}/usr/share/underbudget/logging.properties
  #install -Dm644 data/template.xml ${pkgdir}/usr/share/underbudget/template.xml

  install -Dm755 scripts/underbudgetcli ${pkgdir}/usr/bin/underbudgetcli
}

