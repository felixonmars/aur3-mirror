# Contributor: xduugu
pkgname=egit-tentative
pkgver=0.4.0.200906011726
[ 1 ] && pkgver=$(wget -nv -O - http://www.jgit.org/update-site/site.xml |
                  grep -B1 '<category name="Tentative build"/>' |
                  tail -2 | head -1 | sed 's|.*_\(.\+\)\.jar.*|\1|')
pkgrel=1
pkgdesc="An eclipse team provider for git (experimental build)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/egit/"
license=('EPL')
depends=('eclipse>=3.4' "jgit>=$pkgver")
source=("org.spearce.egit_$pkgver-feature.jar::http://www.jgit.org/update-site/features/org.spearce.egit_$pkgver.jar"
        "http://www.jgit.org/update-site/plugins/org.spearce.egit_$pkgver.jar"
        "http://www.jgit.org/update-site/plugins/org.spearce.egit.core_$pkgver.jar"
        "http://www.jgit.org/update-site/plugins/org.spearce.egit.ui_$pkgver.jar")
noextract=("org.spearce.egit_$pkgver-feature.jar"
          "org.spearce.egit_$pkgver.jar"
          "org.spearce.egit.core_$pkgver.jar"
          "org.spearce.egit.ui_$pkgver.jar")
md5sums=('d957ae48097575b7df81984bd54468bc'
         '606e7b5caa68cfe4c9119324ecd9d175'
         '4d2e4c53583d884c2132cd09fa179868'
         'fe20759aaefdfb6ffe51cdd86df6d56d')
sha256sums=('1ac4c35f0eb5eb2df098e9c717cf7c0b2fb0373e5425b0ea4bf84047e05d437c'
            '8ca3d85b74150b7e1f6811cc8d823c75d42d82c0cc51f08f5f5c61d478453add'
            'ff09f09cc0f8fb64be60540ad93b2efbac7aa22902f70030970b409cacb864b2'
            '3f54196ad8cc2dfac10642cdccdcdab22fb72789454f7560dfef2271394be943')

build() {
  _dest="$pkgdir/usr/share/eclipse/dropins/${pkgname%-*}/eclipse"

  install -d -m755 "$_dest/features/org.spearce.egit_$pkgver" || return 1
  cd "$_dest/features/org.spearce.egit_$pkgver"
  jar xf "$srcdir/org.spearce.egit_$pkgver-feature.jar" feature.xml || return 1

  for i in "" .core .ui; do
    install -D -m644 "$srcdir/org.spearce.egit${i}_$pkgver.jar" \
      "$_dest/plugins/org.spearce.egit${i}_$pkgver.jar" || return 1
  done

  ln -s "/usr/share/java/jgit/org.spearce.jgit.jar" \
    "$_dest/plugins/org.spearce.jgit_$pkgver.jar" || return 1
}

# vim:set ts=2 sw=2 et:
