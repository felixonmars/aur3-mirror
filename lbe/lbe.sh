#!/bin/sh -e
appdir='/opt/lbe'

if [ ! -d "$HOME/.lbe" ]; then
	mkdir -pm0700 "$HOME/.lbe"

	cat > "$HOME/.lbe/lbe.properties" <<-EOF
	base=$HOME/.lbe/
	session.dir=$HOME/.lbe/
	cacert.file=$HOME/.lbe/lbecacerts
	EOF

	cp -a "$appdir/help/uofmichigan.cfg.sample" "$HOME/.lbe/U of Michigan.cfg"

	cp -a "$appdir/attributes.config" "$HOME/.lbe/"

	cp -a "$appdir/templates" "$HOME/.lbe/"
fi

cd "$HOME/.lbe" # FIXME: if we do this, we can ditch lbe.properties; any disadvantages?

umask 077 # protect session files

exec java -jar "$appdir/lbe.jar" "$@"
