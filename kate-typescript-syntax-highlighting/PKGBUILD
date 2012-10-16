# Maintainer: PrettyFlower <abigchode@gmail.com>
pkgname=kate-typescript-syntax-highlighting
pkgver=20121015
pkgrel=1
pkgdesc="Syntax highlighting for TypeScript in Kate"
arch=('any')
url="https://github.com/PrettyFlower/KateTypeScriptSyntaxHighlighting"
license=('GPL')
groups=()
depends=('kdesdk-kate')

package() {
    wget https://raw.github.com/PrettyFlower/KateTypeScriptSyntaxHighlighting/master/typescript.xml
    mkdir -p $pkgdir/usr/share/apps/katepart/syntax
    mv typescript.xml $pkgdir/usr/share/apps/katepart/syntax/typescript.xml
}
