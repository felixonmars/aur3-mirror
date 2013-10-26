# Maintainer: Firef0x <Firefgx (at) gmail (dot) com>
# Contributor: sh0 <mee@sh0.org>
# Contributor: Lekensteyn <lekensteyn@gmail.com>
pkgname=smali2
pkgver=2.0
pkgrel=1
pkgdesc="An assembler/disassembler for Android's dex format"
arch=(any)
url="https://bitbucket.org/JesusFreke/smali"
license=("BSD")
depends=("java-runtime" "bash")
provides=('smali')
conflicts=('smali')
source=("http://cdn.bitbucket.org/JesusFreke/smali/downloads/baksmali"
        "http://cdn.bitbucket.org/JesusFreke/smali/downloads/baksmali-${pkgver}.jar"
        "http://cdn.bitbucket.org/JesusFreke/smali/downloads/smali"
        "http://cdn.bitbucket.org/JesusFreke/smali/downloads/smali-${pkgver}.jar")
sha1sums=('9f7a87ee158b89f9d376ba7de09e0bea39e0cad0'
          '47951986306572162b0a882ea92e849bcadd1186'
          '26423d6a1d882d3feac0fd0b93ddae0ab134551f'
          '9d05171a6e0dc9b9a4934c1f6f1129ecfa79aa54')

package() {
    install -d -m755 "$pkgdir/usr/bin"
    for file in baksmali smali; do
        install -D -m755 "$srcdir/$file" "$pkgdir/usr/share/smali/$file"

        # prevent from printing path on launch
        sed '/echo ${newProg}/d' -i "$pkgdir/usr/share/smali/$file"

        # fix ls path
        sed 's|/bin/ls|/usr/bin/ls|' -i "$pkgdir/usr/share/smali/$file"

        install -D -m644 "$srcdir/$file-$pkgver.jar" "$pkgdir/usr/share/smali/$file.jar"
        ln -s /usr/share/smali/$file "$pkgdir/usr/bin/$file"
    done
}

# vim:set ts=4 sw=4 et:
